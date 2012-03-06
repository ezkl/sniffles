require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/javascript/jquery')

describe Sniffles::Sniffers::Jquery do
  describe "#output" do    
    context "jquery", :vcr => { :cassette_name => "squidoo_com" } do
      let(:jquery)  { described_class.new(page_body("http://www.squidoo.com")) }
      
      it { jquery.output[:found].should eq true }
    end

    context "no jquery" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end