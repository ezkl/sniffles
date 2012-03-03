require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/javascript/jquery')

describe Sniffles::Sniffers::Jquery do
  describe "#output" do
    context "w/ jQuery" do
      before(:all) do
        VCR.use_cassette("squidoo_com") do
          @squidoo = Typhoeus::Request.get("http://www.squidoo.com/", :follow_location => true)
        end
      end
      
      it "should return true" do
        Sniffles::Sniffers::Jquery.new(@squidoo.body).output[:found].should eq true
      end
    end
    

    context "w/o jQuery" do
      it "should return false" do
        Sniffles::Sniffers::Jquery.new("<html><head></head><body>No scripts!</body></html>").output[:found].should eq false
      end
    end
  end
end