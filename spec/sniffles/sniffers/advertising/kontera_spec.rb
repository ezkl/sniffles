require 'spec_helper'
require 'sniffles/sniffers/advertising/kontera'

describe Sniffles::Sniffers::Kontera do
  describe "#output", :vcr => { :cassette_name => "lancelhoff_com" } do
    context "kontera" do
      let(:kontera)  { described_class.new(page_body("http://www.lancelhoff.com/")) }

      it { kontera.output[:found].should eq true }
    end

    context "no kontera" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
