require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/admeld')

describe Sniffles::Sniffers::Admeld do
  describe "#output", :vcr => { :cassette_name => "wundergroud_com" } do
    let(:admeld)  { described_class.new(page_body("http://www.wunderground.com/")) }
    let(:blank)   { described_class.new(empty_html_doc) }
    
    context "admeld" do
      it { admeld.output[:found].should eq true }
    end

    context "no admeld" do
      it { blank.output[:found].should eq false }
    end
  end
end
