module Sniffles
  module Sniffers
    class Invision
      include HTML

      attr_accessor :doc
      attr_reader :output

      def initialize(response_body)
        @output = {}
        parse(response_body) && process_document
      end

      def process_document
        if @output[:found] = found?
          parse_version
        end
      end

      private
      def found?
        !!(copyright_link =~ /Forum Software by IP\.Board/)
      end

      def parse_version
        version_capture = (copyright_link.match(/Software by IP\.Board ([\d]+\.[\d]+\.[\d]+)/))
        @output[:version] = version_capture ? version_capture[1] : false
      end

      def copyright_link
        text_at("//p[@id='copyright']/a/@href")
      end
    end
  end
end
