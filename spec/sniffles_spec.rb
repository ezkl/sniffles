require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Sniffles do
  it "should have a version" do
    subject.const_defined?("VERSION").should be true
  end
  
  describe "#sniff" do
    it "should take a URL" do
      Sniffles.sniff("http://www.google.com/")
      Sniffles.url.should eq "http://www.google.com/"
    end
  end
  
  describe "#url" do
    it "should respond with a URL" 
  end
end
