require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sniffles::Sniffers do
  describe "#use", :vcr do
    before(:all) do
      @wordpress = page_body("http://wordpress.com/")
    end
    
    context "single sniffer", :vcr do
      it "should use the passed sniffer" do
        output = Sniffles::Sniffers.use(@wordpress, :google_analytics)
        output[:found].should be false
      end
    end
  end
    
  describe "#list_all" do
    it "should list all sniffers" do
      subject.list_all.count.should eq SNIFFER_COUNT
    end
  end
  
  describe "#list_groups" do
    it "should list all groups" do
      subject.list_groups.count.should eq SNIFFER_GROUP_COUNT
    end
  end
  
  describe "#list_all_by_group" do
    it "should return a hash of all groups with collections of sniffers" do
      subject.list_all_by_group.count.should eq SNIFFER_GROUP_COUNT
    end
  end
end