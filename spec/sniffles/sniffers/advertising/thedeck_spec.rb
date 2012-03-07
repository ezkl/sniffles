require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/thedeck')

describe Sniffles::Sniffers::Thedeck do
  describe "#output", :vcr => { :cassette_name => "metafilter_com" } do    
    context "thedeck" do
      let(:thedeck)  { described_class.new(page_body("http://www.metafilter.com/")) }
      
      it { thedeck.output[:found].should eq true }
    end

    context "no thedeck" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end
