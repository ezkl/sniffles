module Sniffles
  module Sniffers
    class FacebookInsights
      include Text

      attr_accessor :doc
      attr_reader :output

      def initialize(response_body)
        @output = {}
        parse(response_body) && process_document
      end

      def process_document
        if @output[:found] = found?
          parse_extra_details
        end
      end

      private
      def found?
        match?(/property="fb:(admins|app_id|page_id)"/i)
      end

      def parse_extra_details
        @output[:admin_ids] = capture(/property="fb:admins" content="((\d+)(,\s*\d+)*)"/)
        @output[:app_id] = capture(/"fb:app_id" content="([\d]+)"/)
        @output[:page_id] = capture(/"fb:page_id" content="([\d]+)"/)
      end
    end
  end
end
