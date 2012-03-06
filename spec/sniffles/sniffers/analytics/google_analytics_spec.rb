require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/google_analytics')

describe Sniffles::Sniffers::GoogleAnalytics do
  describe "#output" do
    context "Inline JS", :vcr do
      before(:all) do
        @ga = Sniffles::Sniffers::GoogleAnalytics.new(page_body("http://www.pearsonified.com/"))
      end
      
      it "should return as found" do
        @ga.output[:found].should eq true
      end
      
      it "should return UA" do
        @ga.output[:ua].should eq "UA-2916092-1"
      end
    end
    
    context "Inline w/ Urchin (Old)", :vcr do
      before(:all) do
        @urchin = Sniffles::Sniffers::GoogleAnalytics.new(page_body("http://humemes.com/"))
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
        no_ga = Sniffles::Sniffers::GoogleAnalytics.new(empty_html_doc)
        no_ga.output[:found].should eq false
      end
    end
  end
end