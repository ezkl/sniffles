require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/quantcast')

describe Sniffles::Sniffers::Quantcast do
  describe "#output" do
    context "w/ Quantcast", :vcr do
      before(:all) do
        @squidoo = Typhoeus::Request.get("http://www.squidoo.com").body
      end
      
      it "should return true for found" do
        Sniffles::Sniffers::Quantcast.new(@squidoo).output[:found].should eq true
      end
    end
    

    context "w/o Quantcast" do
      it "should return false" do
        Sniffles::Sniffers::Quantcast.new("<html><head></head><body>No analytics!</body></html>").output[:found].should eq false
      end
    end
  end
end