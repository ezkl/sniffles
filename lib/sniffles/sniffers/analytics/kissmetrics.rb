module Sniffles
  module Sniffers
    class Kissmetrics
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        @output[:found] = kissmetrics?
      end
      
      private
      def kissmetrics?
        match? /i\.kissmetrics\.com/
      end
    end
  end
end