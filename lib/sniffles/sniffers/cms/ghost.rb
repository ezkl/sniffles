module Sniffles
  module Sniffers
    class Ghost
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
        match? /content="Ghost ([\d\.]*)"/
      end
    end
  end
end
