module Sniffles
  module Sniffers
    class GoogleAnalytics
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        if @output[:found] = found?
          parse_google_analytics_ua
        end
      end
      
      private
      def found?
        match?(/google\-analytics\.com\/ga\.js|urchinTracker/i)
      end
      
      def parse_google_analytics_ua
        @output[:ua] = capture(/[\"|\'](UA\-[\d]+\-[\d])[\"|\']/)
      end
    end
  end
end