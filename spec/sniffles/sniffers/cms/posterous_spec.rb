require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/posterous')

describe Sniffles::Sniffers::Posterous do
  describe "#output" do    
    context "posterous", :vcr => { :cassette_name => "blog_posterous_com" } do
      let(:posterous) { described_class.new(page_body("http://blog.posterous.com/")) }
      
      it { posterous.output[:found].should eq true }
    end
    
    context "not posterous" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end