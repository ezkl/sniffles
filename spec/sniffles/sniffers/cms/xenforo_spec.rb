require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/xenforo')

describe Sniffles::Sniffers::Xenforo do
  describe "#output" do    
    context "xenforo", :vcr => { :cassette_name => "xenforo_com" } do
      let(:xenforo)   { described_class.new(page_body("http://xenforo.com/community/")) }
      
      it { xenforo.output[:found].should eq true }
    end
    
    context "not xenforo" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end