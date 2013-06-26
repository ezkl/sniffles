module Sniffles
  module Sniffers
    class Drupal
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
        match?(/Drupal\.settings/)
      end
      
    end
  end
end

