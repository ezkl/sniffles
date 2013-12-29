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
        match?(/googletag\.pubads\(\)/)
      end

      def parse_publisher_id
        if pub_id = capture(/publisher\:\s\"([a-z0-9\-]{10,})\"/)
          @output[:publisher_id] = pub_id
        end
      end
    end
  end
end
