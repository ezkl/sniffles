require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/wordpress')

describe Sniffles::Sniffers::Wordpress do
  describe "#output" do
    context "feed, theme, pingback", :vcr => { :cassette_name => 'pearsonified_com' } do
      let(:wp) { described_class.new(page_body("http://www.pearsonified.com/"))  }
      
      it { wp.output[:found].should eq true }
      it { wp.output[:feed].should eq "http://feeds.feedburner.com/pearsonified" }
      it { wp.output[:theme].should eq "thesis_17" }
      it { wp.output[:pingback].should eq "http://www.pearsonified.com/xmlrpc.php" }
    end
    
    context "version", :vcr => { :cassette_name => 'humemes_com' } do
      let(:wp) { described_class.new(page_body("http://humemes.com/")) }
      
      it { wp.output[:version].should eq "2.3.1" }
    end  
    
    context "not wordpress" do
      let(:blank) { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end