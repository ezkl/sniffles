require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/invision')

describe Sniffles::Sniffers::Invision do
  describe "#output" do    
    context "invision", :vcr => { :cassette_name => "community_invisionpower_com" } do
      let(:invision)   { described_class.new(page_body("http://community.invisionpower.com/")) }
      
      it { invision.output[:found].should eq true }
      it { invision.output[:version].should eq "3.3.0 Beta 3" }
    end
    
    context "not invision" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end