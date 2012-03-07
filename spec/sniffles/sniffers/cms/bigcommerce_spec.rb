require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/bigcommerce')

describe Sniffles::Sniffers::Bigcommerce do
  describe "#output" do    
    context "bigcommerce", :vcr => { :cassette_name => "pandoramoa_com" } do
      let(:bigcommerce)   { described_class.new(page_body("http://www.pandoramoa.com/")) }
      
      it { bigcommerce.output[:found].should eq true }
    end
    
    context "not bigcommerce" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end