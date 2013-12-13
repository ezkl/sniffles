require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/ghost')

describe Sniffles::Sniffers::Ghost do
  describe "#output" do
    context "Ghost blog", :vcr => { :cassette_name => "ghost_org" } do
      let(:ghost)   { described_class.new(page_body("http://blog.ghost.org/")) }

      it { ghost.output[:found].should eq true }
    end

    context "Not a Ghost Blog" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end