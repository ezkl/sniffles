require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/joomla')

describe Sniffles::Sniffers::Joomla do
  describe "#output" do    
    context "joomla", :vcr => { :cassette_name => "joomla_org" } do
      let(:joomla)   { described_class.new(page_body("http://www.joomla.org/")) }
      
      it { joomla.output[:found].should eq true }
      it { joomla.output[:version].should eq "1.5" }
    end
    
    context "not joomla" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end