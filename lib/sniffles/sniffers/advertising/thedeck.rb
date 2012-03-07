module Sniffles
  module Sniffers
    class Thedeck
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
        match? /connect\.decknetwork\.net/
      end
    end
  end
end