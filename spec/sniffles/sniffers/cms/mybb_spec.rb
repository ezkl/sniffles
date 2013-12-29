require 'spec_helper'
require 'sniffles/sniffers/cms/mybb'

describe Sniffles::Sniffers::Mybb do
  describe "#output" do
    context "mybb", :vcr => { :cassette_name => "installatron_com" } do
      let(:mybb)   { described_class.new(page_body("http://livedemo.installatron.com/1388287564mybb/")) }

      it { mybb.output[:found].should eq true }
    end

    context "not mybb" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
