require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/quantcast')

describe Sniffles::Sniffers::Quantcast do
  describe "#output" do
    context "w/ Quantcast", :vcr do
      before(:all) do
        @quantcast = Sniffles::Sniffers::Quantcast.new(page_body("http://www.squidoo.com"))
      end
      
      it "should return true for found" do
        @quantcast.output[:found].should eq true
      end
    end
    

    context "w/o Quantcast" do
      it "should return false" do
        Sniffles::Sniffers::Quantcast.new("<html><head></head><body>No analytics!</body></html>").output[:found].should eq false
      end
    end
  end
end