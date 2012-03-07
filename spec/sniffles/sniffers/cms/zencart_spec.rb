require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/zencart')

describe Sniffles::Sniffers::Zencart do
  describe "#output" do    
    context "zencart", :vcr => { :cassette_name => "orangecrushbeads_com" } do
      let(:zencart)   { described_class.new(page_body("http://orangecrushbeads.com/")) }
      
      it { zencart.output[:found].should eq true }
    end
    
    context "not zencart" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end