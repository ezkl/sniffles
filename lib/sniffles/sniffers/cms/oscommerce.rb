module Sniffles
  module Sniffers
    class Oscommerce
      include HTML
      
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
        !!(@doc.text =~ /Powered by osCommerce/)
      end
    end
  end
end