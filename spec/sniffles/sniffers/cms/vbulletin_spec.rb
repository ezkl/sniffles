require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/vbulletin')

describe Sniffles::Sniffers::Vbulletin do
  describe "#output"  do    
    context "vbulletin w/ meta generator", :vcr => { :cassette_name => "vbulletin_com" } do
      let(:vbulletin) { described_class.new(page_body("https://www.vbulletin.com/forum/forum.php")) }
      
      it { vbulletin.output[:found].should eq true }
      it { vbulletin.output[:version].should eq "4.1.11" }
      it { vbulletin.output[:feed].should eq "https://www.vbulletin.com/forum/external.php?type=RSS2" }
    end
    
    context "vbulletin w/ JS initialization", :vcr => { :cassette_name => "blackhatworld_com" } do
      let(:vbulletin) { described_class.new(page_body("http://www.blackhatworld.com/index.php")) }
      
      it { vbulletin.output[:found].should eq true }
    end
    
    context "not vbulletin" do
      let(:blank) { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
    
  end
end