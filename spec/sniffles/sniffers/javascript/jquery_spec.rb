require "spec_helper"
require 'sniffles/sniffers/javascript/jquery'

describe Sniffles::Sniffers::Jquery do
  describe "#output" do
    context "jquery", :vcr => { :cassette_name => "blog_mixpanel_com" } do
      let(:jquery)  { described_class.new(page_body("http://blog.mixpanel.com/")) }

      it { jquery.output[:found].should eq true }
    end

    context "no jquery" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
