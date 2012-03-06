require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/javascript/jquery')

describe Sniffles::Sniffers::Jquery do
  describe "#output", :vcr => { :cassette_name => "squidoo_com" } do
    let(:jquery)  { Sniffles::Sniffers::Jquery.new(page_body("http://www.squidoo.com")) }
    let(:blank)   { Sniffles::Sniffers::Jquery.new(empty_html_doc) }
    
    context "jquery" do
      it { jquery.output[:found].should eq true }
    end

    context "no jquery" do
      it { blank.output[:found].should eq false }
    end
  end
end