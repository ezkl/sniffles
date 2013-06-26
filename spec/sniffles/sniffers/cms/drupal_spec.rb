require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/drupal')

describe Sniffles::Sniffers::Drupal do
  describe "#output" do    
    context "drupal", :vcr => { :cassette_name => "drupal" } do
      let(:drupal)   { described_class.new(page_body("http://www.whitehouse.gov/")) }
      
      it { drupal.output[:found].should eq true }
    end
    
    context "not drupal" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end