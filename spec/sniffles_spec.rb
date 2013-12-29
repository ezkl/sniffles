require 'spec_helper'

describe Sniffles do
  describe "#sniff", :vcr => { :cassette_name => "blog_mixpanel_com" } do
    let(:blog) { page_body("http://blog.mixpanel.com/") }

    context "one sniffer" do
      it  { subject.sniff(blog, :mixpanel).should eq :mixpanel => { :found => true } }
    end

    context "using multiple sniffers" do
      it { subject.sniff(blog, :jquery, :mixpanel).should include(:jquery, :mixpanel) }
    end

    context "using groups" do
      it { subject.sniff(blog, :analytics).should include(:mixpanel, :google_analytics) }
    end

    context "w/o supplying groups or sniffers" do
      it { subject.sniff(blog).count.should eq SNIFFER_COUNT }
    end

    context "using a non-existent sniffer" do
      it "should raise an error" do
        expect { subject.sniff(blog, :fake_ass_sniffer) }.to raise_error(Sniffles::UnknownSniffer, "fake_ass_sniffer not found!")
      end
    end
  end

  describe "#group?" do
    context "group exists" do
      it { subject.group?(:cms).should be true }
    end

    context "group doesn't exist" do
      it { subject.group?(:wordpress).should be false }
    end
  end

  describe "#sniffer?" do
    context "sniffer exists" do
      it { subject.sniffer?(:wordpress).should be true }
    end

    context "sniffer doesn't exist" do
      it { subject.sniffer?(:cms).should be false }
    end
  end
end
