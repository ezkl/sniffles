require 'spec_helper'
require 'sniffles/sniffers/advertising/adsense'

describe Sniffles::Sniffers::Adsense do
  describe "#output" do
    context "found", :vcr => { :cassette_name => "digital-photography-school_com" } do
      let(:adsense)  { described_class.new(page_body("http://digital-photography-school.com/digital-photography-tips-for-beginners")) }

      it { adsense.output[:found].should eq true }
    end

    context "not found" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
