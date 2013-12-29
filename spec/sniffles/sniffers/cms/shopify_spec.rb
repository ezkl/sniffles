require 'spec_helper'
require 'sniffles/sniffers/cms/shopify'

describe Sniffles::Sniffers::Shopify do
  describe "#output" do
    context "shopify", :vcr => { :cassette_name => "cxxvi_com" } do
      let(:shopify)   { described_class.new(page_body("http://cxxvi.com/")) }

      it { shopify.output[:found].should eq true }
    end

    context "not shopify" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
