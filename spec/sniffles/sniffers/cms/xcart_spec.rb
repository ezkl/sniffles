require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/xcart')

describe Sniffles::Sniffers::Xcart do
  describe "#output" do
    context "xcart", :vcr => { :cassette_name => 'exprodirect_com' } do
      let(:xcart)   { described_class.new(page_body("http://www.exprodirect.com/")) }
      
      it { xcart.output[:found].should eq true }
    end
    
    context "not xcart" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end