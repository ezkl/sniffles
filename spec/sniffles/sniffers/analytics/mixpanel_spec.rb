require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/mixpanel')

describe Sniffles::Sniffers::Mixpanel do
  describe "#output" do
    context "w/ Mixpanel", :vcr do
      before(:all) do
        @squidoo = Typhoeus::Request.get("http://www.squidoo.com").body
      end
      
      it "should return UA" do
        Sniffles::Sniffers::Mixpanel.new(@squidoo).output[:found].should eq true
      end
    end
    

    context "w/o Mixpanel" do
      it "should return false" do
        Sniffles::Sniffers::Mixpanel.new("<html><head></head><body>No analytics!</body></html>").output[:found].should eq false
      end
    end
  end
end