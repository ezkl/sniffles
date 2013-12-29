require 'spec_helper'
require 'sniffles/sniffers/cms/phpbb'

describe Sniffles::Sniffers::Phpbb do
  describe "#output" do
    context "phpBB forum", :vcr => { :cassette_name => "phpbb_com" } do
      let(:phpbb)   { described_class.new(page_body("https://www.phpbb.com/styles/demo/3.0/board/index.php?style=3")) }

      it { phpbb.output[:found].should eq true }
    end

    context "Not a phpBB Forum" do
      let(:blank)   { described_class.new(empty_html_doc) }

      it { blank.output[:found].should eq false }
    end
  end
end
