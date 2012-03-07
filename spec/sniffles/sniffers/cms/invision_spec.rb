require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/invision')

describe Sniffles::Sniffers::Invision do
  describe "#output" do    
    context "invision", :vcr => { :cassette_name => "community_invisionpower_com" } do
      subject { described_class.new(page_body("http://community.invisionpower.com/")).output }
      
      its([:found])   { should eq true }
      its([:version]) { should eq "3.3.0 Beta 3" }
    end
    
    context "invision w/o version", :vcr => { :cassette_name => "invisionmodding_com" } do
      subject { described_class.new(page_body("http://invisionmodding.com/")).output }

      its([:found])   { should eq true }
      its([:version]) { should eq false }
    end
    
    context "not invision" do
      subject { described_class.new(empty_html_doc).output }
      
      its([:found]) { should eq false }
    end
  end
end