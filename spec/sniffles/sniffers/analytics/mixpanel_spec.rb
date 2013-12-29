require 'spec_helper'
require 'sniffles/sniffers/analytics/mixpanel'

describe Sniffles::Sniffers::Mixpanel do
  describe "#output" do
    context "using mixpanel", :vcr => { :cassette_name => "blog_mixpanel_com" } do
      let(:mixpanel) { described_class.new(page_body("http://blog.mixpanel.com/")) }

      it { mixpanel.output[:found].should eq true }
    end

    context "not using mixpanel" do
      let(:blank) { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
