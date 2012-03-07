require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/typepad')

describe Sniffles::Sniffers::Typepad do
  describe "#output" do    
    context "typepad", :vcr => { :cassette_name => "soulemama_typepad_com" } do
      subject { described_class.new(page_body("http://www.soulemama.typepad.com/")).output }
      
      its([:found])   { should eq true }
    end

    context "not typepad" do
      subject { described_class.new(empty_html_doc).output }
      
      its([:found]) { should eq false }
    end
  end
end