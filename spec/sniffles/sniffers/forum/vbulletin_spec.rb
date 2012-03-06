require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/forum/vbulletin')

describe Sniffles::Sniffers::Vbulletin, :vcr do
  before(:all) do
    @vbulletin = Sniffles::Sniffers::Vbulletin.new(page_body("https://www.vbulletin.com/forum/forum.php"))
    @wordpress = Sniffles::Sniffers::Vbulletin.new(page_body("http://www.wordpress.com"))
  end
  
  describe "#vbulletin?" do
    context "vbulletin forum" do
      it { @vbulletin.output[:found].should eq true }
      it { @vbulletin.output[:version].should eq "4.1.11" }
      it { @vbulletin.output[:feed].should eq "https://www.vbulletin.com/forum/external.php?type=RSS2" }
    end
    
    context "not vbulletin forum" do
      it { @wordpress.output[:found].should eq false }
    end
  end
end