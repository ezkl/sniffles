require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/vanilla')

describe Sniffles::Sniffers::Vanilla do
  describe "#output" do    
    context "vanilla", :vcr => { :cassette_name => "forum-software_org_vanilla" } do
      let(:vanilla)   { described_class.new(page_body("http://demo.forum-software.org/vanilla/")) }
      
      it { vanilla.output[:found].should eq true }
    end
    
    context "not vanilla" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end