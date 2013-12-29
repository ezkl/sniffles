require 'spec_helper'
require 'sniffles/sniffers/advertising/tribalfusion'

describe Sniffles::Sniffers::Tribalfusion do
  describe "#output", :vcr => { :cassette_name => "sixflags_com" } do
    context "tribalfusion" do
      let(:tribalfusion)  { described_class.new(page_body("http://www.sixflags.com/national/index.aspx")) }

      it { tribalfusion.output[:found].should eq true }
    end

    context "no tribalfusion" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
