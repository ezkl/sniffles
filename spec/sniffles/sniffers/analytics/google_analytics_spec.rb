require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/google_analytics')

describe Sniffles::Sniffers::GoogleAnalytics do
  describe "#output" do
    context "inline js", :vcr => { :cassette_name => "pearsonified_com" } do
      let(:ga) { described_class.new(page_body("http://www.pearsonified.com/")) }
      
      it { ga.output[:found].should eq true }
      it { ga.output[:ua].should eq "UA-2916092-1" }
    end
    
    context "inline w/ urchin", :vcr => { :cassette_name => "humemes_com" } do
      let(:ga) { described_class.new(page_body("http://humemes.com/")) }
      
      it { ga.output[:found].should eq true }
      it { ga.output[:ua].should eq "UA-386965-7" }
    end
    
    context "inline w/ gaJsHost syntax", :vcr => { :cassette_name => "blackhatworld_com" } do
      let(:ga) { described_class.new(page_body("http://www.blackhatworld.com/index.php")) }
      
      it { ga.output[:found].should eq true }
      it { ga.output[:ua].should eq "UA-24324223-1" }
    end

    context "no google analytics" do
      let(:blank) { described_class.new(empty_html_doc) }
      it { blank.output[:found].should eq false }
    end
  end
end