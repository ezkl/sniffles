require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/casale')

describe Sniffles::Sniffers::Casale do
  describe "#output", :vcr => { :cassette_name => "topix_com" } do    
    context "casale" do
      let(:casale)  { described_class.new(page_body("http://www.topix.com/")) }
      
      it { casale.output[:found].should eq true }
    end

    context "no casale" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end
