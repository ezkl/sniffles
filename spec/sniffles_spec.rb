require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Sniffles do
  it "should have a version" do
    subject.const_defined?("VERSION").should be true
  end
end