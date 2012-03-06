require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/advertising/adsense')

describe Sniffles::Sniffers::Adsense do
  describe "#output" do    
    context "found", :vcr => { :cassette_name => "squidoo_com" } do
      let(:adsense)  { described_class.new(page_body("http://www.squidoo.com")) }
      
      it { adsense.output[:found].should eq true }
      it { adsense.output[:publisher_id].should eq "ca-pub-9879162776784828" }
    end

    context "not found" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end
