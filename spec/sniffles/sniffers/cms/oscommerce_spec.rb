require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/oscommerce')

describe Sniffles::Sniffers::Oscommerce do
  describe "#output" do    
    context "oscommerce", :vcr => { :cassette_name => "demo_oscommerce_com" } do
      let(:oscommerce)   { described_class.new(page_body("http://demo.oscommerce.com/")) }
      
      it { oscommerce.output[:found].should eq true }
    end
    
    context "not oscommerce" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end