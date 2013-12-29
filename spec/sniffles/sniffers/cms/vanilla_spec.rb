require 'spec_helper'
require 'sniffles/sniffers/cms/vanilla'

describe Sniffles::Sniffers::Vanilla do
  describe "#output" do
    context "vanilla", :vcr => { :cassette_name => "geomagik_com" } do
      let(:vanilla)   { described_class.new(page_body("http://www.geomagik.com/forum/")) }

      it { vanilla.output[:found].should eq true }
    end

    context "not vanilla" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
