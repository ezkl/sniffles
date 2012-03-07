require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/shopify')

describe Sniffles::Sniffers::Shopify do
  describe "#output" do    
    context "shopify", :vcr => { :cassette_name => "shop_angrybirds_com" } do
      let(:shopify)   { described_class.new(page_body("http://shop.angrybirds.com/")) }
      
      it { shopify.output[:found].should eq true }
    end
    
    context "not shopify" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end