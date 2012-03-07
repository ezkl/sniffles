module Sniffles
  module Sniffers
    class Shopify
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
        match? /cdn\.shopify\.com/
      end
    end
  end
end