require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/chartbeat')

describe Sniffles::Sniffers::Chartbeat do
  describe "#output", :vcr => { :cassette_name => "foursquare_com" } do
    let(:chartbeat)  { described_class.new(page_body("https://foursquare.com")) }
    let(:blank)   { described_class.new(empty_html_doc) }
    
    context "chartbeat" do
      it { chartbeat.output[:found].should eq true }
    end

    context "no chartbeat" do
      it { blank.output[:found].should eq false }
    end
  end
end
