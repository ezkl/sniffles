require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/wordpress')

describe "Sniffers::WordPress" do
  context "WordPress Blog w/ feed, theme, and pingback" do
    describe "#output" do
      before(:all) do
        VCR.use_cassette("pearsonified_com") do
          @pearsonified = Typhoeus::Request.get("http://www.pearsonified.com/")
          @wp = Sniffles::Sniffers::Wordpress.new(@pearsonified.body)
        end
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
  
  context "WordPress Blog w/ version" do    
    describe "#output" do
      before(:all) do
        VCR.use_cassette("humemes_com") do
          @humemes = Typhoeus::Request.get("http://humemes.com/")
          @wp_version = Sniffles::Sniffers::Wordpress.new(@humemes.body)
        end
      end
      
      it "should return the version" do
        @wp_version.output[:version].should eq "2.3.1"
      end
    end
  end
  
  context "Not a WordPress Blog" do
    before(:all) do
      VCR.use_cassette("google_com") do
        @google = Typhoeus::Request.get("http://www.google.com/")
        @not_wp = Sniffles::Sniffers::Wordpress.new(@google.body)
      end
    end
    
    it "should return false" do
      @not_wp.output[:found].should eq false
    end
  end
end