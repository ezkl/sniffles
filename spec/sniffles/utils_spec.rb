require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sniffles::Utils do
  describe "#absolute_uri" do
    context "success" do
      it "should join base host with relative path" do
        subject.absolute_uri("http://www.google.com","/search").should eq "http://www.google.com/search"
      end


      it "should join host w/ directory and relative path" do
        subject.absolute_uri("http://www.google.com/search/", "/query").should eq "http://www.google.com/query"
      end

      it "should join host w/ directory and path" do
        subject.absolute_uri("http://www.google.com/search/", "query").should eq "http://www.google.com/search/query"
      end
    end
  end
end
