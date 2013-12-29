require 'spec_helper'
require 'sniffles/sniffers/analytics/kissmetrics'

describe Sniffles::Sniffers::Kissmetrics do
  describe "#output", :vcr => { :cassette_name => "kissmetrics_com" } do
    let(:kissmetrics)  { described_class.new(page_body("https://www.kissmetrics.com/")) }
    let(:blank)   { described_class.new(empty_html_doc) }

    context "kissmetrics" do
      it { kissmetrics.output[:found].should eq true }
    end

    context "no kissmetrics" do
      it { blank.output[:found].should eq false }
    end
  end
end
