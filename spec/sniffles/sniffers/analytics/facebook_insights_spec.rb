require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/analytics/facebook_insights')

describe Sniffles::Sniffers::FacebookInsights do
  describe "#output" do
    context "facebook_insights", :vcr => { :cassette_name => 'facebook_insights' } do
      let(:facebook_insights) { described_class.new(page_body("http://simplymeasured.com")) }
      
      it { facebook_insights.output[:found].should eq true }
      it { facebook_insights.output[:admin_ids].should eq '661401101, 100000956903317, 827925001, 7001517' }
      it { facebook_insights.output[:app_id].should eq '208102605913336' }
      it { facebook_insights.output[:page_id].should eq '155315114482294' }
    end

    context "no quantcast" do
      let(:blank) { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end