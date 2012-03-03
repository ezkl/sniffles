require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sniffles::Sniffers do  
  describe "#list_all" do
    it "should list all sniffers" do
      Sniffles::Sniffers.list_all.count.should eq SNIFFER_COUNT
    end
  end
  
  describe "#list_groups" do
    it "should list all groups" do
      Sniffles::Sniffers.list_groups.count.should eq SNIFFER_GROUP_COUNT
    end
  end
  
  describe "#list_all_by_group" do
    it "should return a hash of all groups with collections of sniffers" do
      Sniffles::Sniffers.list_all_by_group.count.should eq SNIFFER_GROUP_COUNT
    end
  end
end