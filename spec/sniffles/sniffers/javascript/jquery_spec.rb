require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/javascript/jquery')

describe Sniffles::Sniffers::Jquery do
  describe "#output", :vcr do
    context "w/ jQuery" do
      before(:all) do
        @jquery = Sniffles::Sniffers::Jquery.new(page_body("http://www.squidoo.com"))
      end
      
      it "should return true" do
        @jquery.output[:found].should eq true
      end
    end
    

    context "w/o jQuery" do
      it "should return false" do
        Sniffles::Sniffers::Jquery.new("<html><head></head><body>No scripts!</body></html>").output[:found].should eq false
      end
    end
  end
end