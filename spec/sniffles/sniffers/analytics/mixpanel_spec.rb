require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/mixpanel')

describe Sniffles::Sniffers::Mixpanel do
  describe "#output" do
    context "w/ Mixpanel" do
      before(:all) do
        VCR.use_cassette("squidoo_com") do
          @squidoo = Typhoeus::Request.get("http://www.squidoo.com/", :follow_location => true)
        end
      end
      
      it "should return UA" do
        Sniffles::Sniffers::Mixpanel.new(@squidoo.body).output[:found].should eq true
      end
    end
    

    context "w/o Mixpanel" do
      it "should return false" do
        Sniffles::Sniffers::Mixpanel.new("<html><head></head><body>No analytics!</body></html>").output[:found].should eq false
      end
    end
  end
end