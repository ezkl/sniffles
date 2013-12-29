require 'spec_helper'
require 'sniffles/sniffers/analytics/quantcast'

describe Sniffles::Sniffers::Quantcast do
  describe "#output" do
    context "quantcast", :vcr => { :cassette_name => 'stackoverflow_com' } do
      let(:quantcast) { described_class.new(page_body("http://stackoverflow.com/")) }

      it { quantcast.output[:found].should eq true }
    end

    context "no quantcast" do
      let(:blank) { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
