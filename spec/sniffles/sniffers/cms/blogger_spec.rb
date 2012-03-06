require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/blogger')

describe Sniffles::Sniffers::Blogger do
  describe "#output" do    
    context "blogger", :vcr => { :cassette_name => "google_blogspot_com" } do
      let(:blogger)   { described_class.new(page_body("http://google.blogspot.com/")) }
      
      it { blogger.output[:found].should eq true }
    end
    
    context "not blogger" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end