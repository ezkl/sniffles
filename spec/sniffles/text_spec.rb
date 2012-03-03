require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Sniffles::Text" do
  before(:all) do
    class Klass
      include Sniffles::Text
      attr_accessor :doc
    end
    
    @klass = Klass.new
    @text = "This is multi-line\ntext."
    @klass.parse @text
  end
  
  describe "#parse" do
    it "should take text and return a string" do
      @klass.doc.should eq @text
    end
  end
  
  describe "#match?" do
    context "does match" do
      it "should return true" do
        @klass.match?(/is/).should eq true
      end
    end
    
    context "does not match" do
      it "should return false" do
        @klass.match?(/foobar/).should eq false
      end
    end
  end
  
  describe "#capture" do
    context "match" do
      it "should return the first captured string" do
        @klass.capture(/(multi\-line)/).should eq "multi-line"
      end
    end
    
    context "no match" do
      it "should return false" do
        @klass.capture(/(foobar)/).should eq false
      end
    end
  end
end