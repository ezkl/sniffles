require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/sitefinity')

describe Sniffles::Sniffers::Sitefinity do
  describe "#output" do    
    context "Sitefinity", :vcr => { :cassette_name => "sitefinity_com" } do
      let(:sitefinity)   { described_class.new(page_body("http://sites.kiwanis.org/kiwanis/en/home.aspx")) }
      
      it { sitefinity.output[:found].should eq true }
      it { sitefinity.output[:version].should eq "3.7" }
    end
    
    context "Not a Sitefinity website" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
      it { blank.output[:version].nil?.should eq true }
    end
  end
end