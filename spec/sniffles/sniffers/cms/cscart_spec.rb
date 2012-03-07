require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/cscart')

describe Sniffles::Sniffers::Cscart do
  describe "#output" do    
    context "cscart", :vcr => { :cassette_name => "demo_cs-cart_com" } do
      let(:cscart)   { described_class.new(page_body("http://demo.cs-cart.com/community/")) }
      
      it { cscart.output[:found].should eq true }
    end
    
    context "not cscart" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end