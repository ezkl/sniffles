module Sniffles
  module Sniffers
    class Adsense
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        if @output[:found] = found?
          parse_publisher_id
        end
      end
      
      private
      def found?
        match? /googleAddAdSenseService/
      end
      
      def parse_publisher_id
        @output[:publisher_id] = capture(/googleAddAdSenseService\(["|']+([a-z]+\-pub\-[\d]+)["|']+\)/)
      end
    end
  end
end