require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/wordpress')

describe "Sniffers::WordPress" do
  context "WordPress Blog w/ feed, theme, and pingback" do
    describe "#output", :vcr do
      before(:all) do
        @wp = Sniffles::Sniffers::Wordpress.new(page_body("http://www.pearsonified.com/"))
      end
      
      it "should return found as true" do
        @wp.output[:found].should eq true
      end
      
      it "should return feed URI" do
        @wp.output[:feed].should eq "http://feeds.feedburner.com/pearsonified"
      end
      
      it "should return theme" do
        @wp.output[:theme].should eq "thesis_17"
      end
      
      it "should return pingback URI" do
        @wp.output[:pingback].should eq "http://www.pearsonified.com/xmlrpc.php"
      end
      
      it "should return version as false" do
        @wp.output[:version].should eq false
      end
      
    end
  end
  
  context "WordPress Blog w/ version", :vcr do    
    describe "#output" do
      before(:all) do
        @wp_version = Sniffles::Sniffers::Wordpress.new(page_body("http://humemes.com/"))
      end
      
      it "should return the version" do
        @wp_version.output[:version].should eq "2.3.1"
      end
    end
  end
  
  context "Not a WordPress Blog", :vcr do
    before(:all) do
      @not_wp = Sniffles::Sniffers::Wordpress.new(page_body("http://www.google.com/"))
    end
    
    it "should return false" do
      @not_wp.output[:found].should eq false
    end
  end
end