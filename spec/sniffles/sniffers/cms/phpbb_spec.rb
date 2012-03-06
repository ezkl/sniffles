require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/phpbb')

describe Sniffles::Sniffers::Phpbb do
  describe "#output" do    
    context "phpBB forum", :vcr => { :cassette_name => "phpbb_com" } do
      let(:phpbb)   { Sniffles::Sniffers::Phpbb.new(page_body("http://www.phpbb.com/styles/demo/3.0/board/?style=0")) }
      
      it { phpbb.output[:found].should eq true }
    end
    
    context "Not a phpBB Forum" do
      let(:blank)   { Sniffles::Sniffers::Phpbb.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end