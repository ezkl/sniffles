require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Sniffles::HTML" do
  before(:all) do
    class Klass
      include Sniffles::HTML
      attr_accessor :doc
    end
    
    @klass = Klass.new
    @klass.parse "<html><head><title>Title!</title></head><body><h1>Body!</h1></body></html>"
  end
  
  describe "#parse" do
    it "should take HTML and return a parsed Nokogiri document" do
      @klass.doc.should be_kind_of(Nokogiri::HTML::Document)
    end
  end
  
  describe "#text_match?" do
    context "does match" do
      it "should be true" do
        @klass.text_match?("//title", "Title!").should be true
      end
    end
    
    context "does not match" do
      it "should be false" do
        @klass.text_match?("//title", "Body!").should be false
      end
    end
  end
end