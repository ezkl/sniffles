require 'spec_helper'
require 'sniffles/sniffers/cms/joomla'

describe Sniffles::Sniffers::Joomla do
  describe "#output" do
    context "joomla", :vcr => { :cassette_name => "joomla" } do
      let(:joomla)   { described_class.new(page_body("http://indevol.bellasartes.uclm.es/")) }

      it { joomla.output[:found].should eq true }
      it { joomla.output[:version].should eq "1.5" }
    end

    context "not joomla" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
