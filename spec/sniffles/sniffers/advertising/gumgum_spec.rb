require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/gumgum')

describe Sniffles::Sniffers::Gumgum do
  describe "#output", :vcr => { :cassette_name => "tmz_com" } do    
    context "gumgum" do
      let(:gumgum)  { described_class.new(page_body("http://www.tmz.com")) }
      
      it { gumgum.output[:found].should eq true }
    end

    context "no gumgum" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end
