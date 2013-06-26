require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/magento')

describe Sniffles::Sniffers::Magento do
  describe "#output" do    
    context "magento", :vcr => { :cassette_name => "magento" } do
      let(:magento)   { described_class.new(page_body("http://www.jonessoda.com/")) }
      
      it { magento.output[:found].should eq true }
    end
    
    context "not magento" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end