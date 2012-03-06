require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/buysellads')

describe Sniffles::Sniffers::Buysellads do
  describe "#output", :vcr => { :cassette_name => "guistyles_com" } do    
    context "buysellads" do
      let(:buysellads)  { described_class.new(page_body("http://guistyles.com/")) }
      
      it { buysellads.output[:found].should eq true }
    end

    context "no buysellads" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end
