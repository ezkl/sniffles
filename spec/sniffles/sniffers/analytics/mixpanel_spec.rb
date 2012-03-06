require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/mixpanel')

describe Sniffles::Sniffers::Mixpanel do
  describe "#output" do
    context "w/ Mixpanel", :vcr do
      before(:all) do
        @mixpanel = Sniffles::Sniffers::Mixpanel.new(page_body("http://www.squidoo.com"))
      end
      
      it "should return as found" do
        @mixpanel.output[:found].should eq true
      end
    end
    

    context "w/o Mixpanel" do
      it "should return false" do
        Sniffles::Sniffers::Mixpanel.new(empty_html_doc).output[:found].should eq false
      end
    end
  end
end