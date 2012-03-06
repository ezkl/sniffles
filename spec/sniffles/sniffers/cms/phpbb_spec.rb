require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/phpbb')

describe "Sniffers::Phpbb" do
  context "phpBB Forum" do
    describe "#output", :vcr do
      before(:all) do
        @pbbforum = Typhoeus::Request.get("http://www.phpbb.com/styles/demo/3.0/board/?style=0").body
        @phpbb = Sniffles::Sniffers::Phpbb.new(@pbbforum)
      end
      
      it "should return found as true" do
        @phpbb.output[:found].should eq true
      end

    end
  end
  
  context "Not a phpBB Forum", :vcr do
    before(:all) do
      @google = Typhoeus::Request.get("http://www.google.com/").body
      @not_wp = Sniffles::Sniffers::Phpbb.new(@google)
    end
    
    it "should return false" do
      @not_wp.output[:found].should eq false
    end
  end
end