require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/piwik')

describe Sniffles::Sniffers::Piwik do
  describe "#output", :vcr => { :cassette_name => "downlopedia_com" } do
    let(:piwik)  { described_class.new(page_body("http://www.downlopedia.com/")) }
    let(:blank)   { described_class.new(empty_html_doc) }
    
    context "piwik" do
      it { piwik.output[:found].should eq true }
    end

    context "no piwik" do
      it { blank.output[:found].should eq false }
    end
  end
end
