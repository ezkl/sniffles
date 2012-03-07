require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/prestashop')

describe Sniffles::Sniffers::Prestashop do
  describe "#output" do    
    context "prestashop", :vcr => { :cassette_name => "demo-store_prestashop_com" } do
      let(:prestashop)   { described_class.new(page_body("http://demo-store.prestashop.com/en/")) }
      
      it { prestashop.output[:found].should eq true }
    end
    
    context "not prestashop" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end