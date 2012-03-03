require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Sniffles do
  describe "#sniff" do
    before(:all) do
      VCR.use_cassette("squidoo_com") do
        @squidoo = Typhoeus::Request.get("http://www.squidoo.com/", :follow_location => true).body
      end
      
    end
    
    context "using sniffers" do
      it "returns a hash of sniffers and their responses" do
        sniff = Sniffles.sniff(@squidoo, :mixpanel, :google_analytics)
        sniff[:mixpanel][:found].should eq true
        sniff[:google_analytics][:found].should eq true
      end
    end
    
    context "using groups" do
      it "returns a hash of sniffers and their responses" do
        sniff = Sniffles.sniff(@squidoo, :analytics, :cms, :javascript)
        sniff[:mixpanel][:found].should eq true
        sniff[:google_analytics][:found].should eq true
        sniff[:wordpress][:found].should eq false
        sniff[:jquery][:found].should eq true
      end
    end
  end
  
  describe "convenience methods" do
    it "should make it easier to see available sniffers" do
      subject.list_all.count.should be SNIFFER_COUNT
      subject.list_groups.count.should be SNIFFER_GROUP_COUNT
      subject.list_all_by_group.count.should be SNIFFER_GROUP_COUNT
    end
  end
end
