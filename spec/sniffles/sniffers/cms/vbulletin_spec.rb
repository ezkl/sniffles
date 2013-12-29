require 'spec_helper'
require 'sniffles/sniffers/cms/vbulletin'

describe Sniffles::Sniffers::Vbulletin do
  describe "#output"  do
    context "vbulletin w/ meta generator and JS", :vcr => { :cassette_name => "blackhatworld_com" } do
      let(:vbulletin) { described_class.new(page_body("http://www.blackhatworld.com/")) }

      it { vbulletin.output[:found].should eq true }
      it { vbulletin.output[:version].should eq "4.2.1" }
      it { vbulletin.output[:feed].should eq "http://www.blackhatworld.com/blackhat-seo/external.php?type=RSS2" }
      it { vbulletin.output[:found].should eq true }
    end

    context "not vbulletin" do
      let(:blank) { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
