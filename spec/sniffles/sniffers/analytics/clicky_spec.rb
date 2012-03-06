require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/clicky')

describe Sniffles::Sniffers::Clicky do
  describe "#output", :vcr => { :cassette_name => "beenverified_com" } do
    let(:clicky)  { described_class.new(page_body("http://www.beenverified.com/")) }
    let(:blank)   { described_class.new(empty_html_doc) }
    
    context "clicky" do
      it { clicky.output[:found].should eq true }
    end

    context "no clicky" do
      it { blank.output[:found].should eq false }
    end
  end
end
