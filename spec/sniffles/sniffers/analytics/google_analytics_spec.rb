require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/google_analytics')

describe Sniffles::Sniffers::GoogleAnalytics do
  describe "#output" do
    context "Inline JS" do
      before(:all) do
        VCR.use_cassette("pearsonified_com") do
          @pearsonified = Typhoeus::Request.get("http://www.pearsonified.com/")
          @ga = Sniffles::Sniffers::GoogleAnalytics.new(@pearsonified.body)
        end
      end
      
      it "should return as found" do
        @ga.output[:found].should eq true
      end
      
      it "should return UA" do
        @ga.output[:ua].should eq "UA-2916092-1"
      end
    end
    
    context "Inline w/ Urchin (Old)" do
      before(:all) do
        VCR.use_cassette("humemes_com") do
          @humemes = Typhoeus::Request.get("http://humemes.com/")
          @urchin = Sniffles::Sniffers::GoogleAnalytics.new(@humemes.body)
        end
      end
      
      it "should return as found" do
        @urchin.output[:found].should eq true
      end
      
      it "should return UA" do
        @urchin.output[:ua].should eq "UA-386965-7"
      end
    end

    context "No Google Analytics" do
      it "should return false" do
        no_ga = Sniffles::Sniffers::GoogleAnalytics.new("<html><head></head><body>No analytics!</body></html>")
        no_ga.output[:found].should eq false
      end
    end
  end
end