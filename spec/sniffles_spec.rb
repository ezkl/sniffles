require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Sniffles do
  it "should have a version" do
    subject.const_defined?("VERSION").should be true
  end
  
  describe "#sniff" do
    before(:all) do
      VCR.use_cassette("wordpress") do
        @body = Typhoeus::Request.get("http://www.wordpress.com/", :follow_location => true).body
      end
      @wp = Sniffles.sniff(@body)
    end
    
    it "should identify WordPress" do
      @wp.should include(:wordpress => true)
    end
    
    it "should identify jQuery" do
      @wp.should include(:jquery => true)
    end
    
    it "should identify Quantcast" do
      @wp.should include(:quantcast => true)
    end
  end
end
