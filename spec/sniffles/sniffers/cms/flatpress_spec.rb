require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/flatpress')

describe Sniffles::Sniffers::Flatpress do
  describe "#output" do    
    context "flatpress", :vcr => { :cassette_name => "flatpress_org_home_blog" } do
      let(:flatpress)   { described_class.new(page_body("http://flatpress.org/home/blog.php")) }
      
      it { flatpress.output[:found].should eq true }
      it { flatpress.output[:version].should eq "0.703.5" }
    end
    
    context "not flatpress" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end