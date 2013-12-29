require 'spec_helper'
require 'sniffles/sniffers/analytics/google_analytics'

describe Sniffles::Sniffers::GoogleAnalytics do
  describe "#output" do
    opts = { cassette_name: "pearsonified_com" }

    describe "inline js", vcr: opts  do
      let(:ga) { described_class.new(page_body("http://www.pearsonified.com/")) }

      it { ga.output[:found].should eq true }
      it { ga.output[:ua].should eq "UA-2916092-1" }
    end

    context "no google analytics" do
      let(:blank) { described_class.new(empty_html_doc) }
      it { blank.output[:found].should eq false }
    end
  end
end
