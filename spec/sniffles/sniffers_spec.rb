require 'spec_helper'

describe Sniffles::Sniffers do
  describe "#use" do
    context "single sniffer", :vcr => { :cassette_name => "wordpress_com" } do
      let(:wordpress) { page_body("http://wordpress.com/") }
      
      it { subject.use(wordpress, :google_analytics).should include(:found) }
    end
  end
    
  describe "#list_all" do
    it  { subject.list_all.count.should eq SNIFFER_COUNT }
  end
  
  describe "#list_groups" do
    it { subject.list_groups.count.should eq SNIFFER_GROUP_COUNT }
  end
  
  describe "#list_all_by_group" do
    it { subject.list_all_by_group.count.should eq SNIFFER_GROUP_COUNT }
  end
end