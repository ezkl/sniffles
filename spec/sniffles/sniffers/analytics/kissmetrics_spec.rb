require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/kissmetrics')

describe Sniffles::Sniffers::Kissmetrics do
  describe "#output", :vcr => { :cassette_name => "foursquare_com" } do
    let(:kissmetrics)  { described_class.new(page_body("https://foursquare.com")) }
    let(:blank)   { described_class.new(empty_html_doc) }
    
    context "kissmetrics" do
      it { kissmetrics.output[:found].should eq true }
    end

    context "no kissmetrics" do
      it { blank.output[:found].should eq false }
    end
  end
end
