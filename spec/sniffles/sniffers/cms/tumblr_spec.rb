require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/tumblr')

describe Sniffles::Sniffers::Tumblr do
  describe "#output" do    
    context "tumblr", :vcr => { :cassette_name => "staff_tumblr_com" } do
      let(:tumblr)   { described_class.new(page_body("http://staff.tumblr.com")) }
      
      it { tumblr.output[:found].should eq true }
    end
    
    context "not tumblr" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end