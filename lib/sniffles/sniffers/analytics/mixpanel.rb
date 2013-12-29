module Sniffles
  module Sniffers
    class Mixpanel
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
        match?(/api\.mixpanel\.com\/.+mixpanel\.[0-9]?\.?js/)
      end
    end
  end
end
