module Sniffles
  module Sniffers
    class Magento
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        @output[:found] = found?
      end
      
      private
      def found?
        match?(/var BLANK_URL = 'http(s*):\/\/(.*)\/js\/blank.html'/) &&
        match?(/var BLANK_IMG = 'http(s*):\/\/(.*)\/js\/spacer.gif'/)
      end
      
    end
  end
end


