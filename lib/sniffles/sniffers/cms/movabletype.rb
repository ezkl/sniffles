module Sniffles
  module Sniffers
    class Movabletype
      include HTML

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
        !!(meta_generator_content =~ /mt-static/)
      end

      def meta_generator_content
        text_at("//link[@rel='icon']/@href")
      end
    end
  end
end
