module Sniffles
  module Sniffers
    class Clicky
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        @output[:found] = clicky?
      end
      
      private
      def clicky?
        match? /static\.getclicky\.com/
      end
    end
  end
end