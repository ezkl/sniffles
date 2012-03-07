require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/mybb')

describe Sniffles::Sniffers::Mybb do
  describe "#output" do    
    context "mybb", :vcr => { :cassette_name => "demo_forum-software_org_mybb" } do
      let(:mybb)   { described_class.new(page_body("http://demo.forum-software.org/mybb/")) }
      
      it { mybb.output[:found].should eq true }
    end
    
    context "not mybb" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end