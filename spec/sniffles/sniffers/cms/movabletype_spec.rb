require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lib/sniffles/sniffers/cms/movabletype')

describe Sniffles::Sniffers::Movabletype do
  describe "#output" do    
    context "movabletype", :vcr => { :cassette_name => "movabletype_com_blog" } do
      let(:movabletype)   { described_class.new(page_body("http://www.movabletype.com/blog/")) }
      
      it { movabletype.output[:found].should eq true }
    end
    
    context "not movabletype" do
      let(:blank)   { described_class.new(empty_html_doc) }
      
      it { blank.output[:found].should eq false }
    end
  end
end