module Sniffles
  module Sniffers
    class Xenforo
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
        meta_description_content == "Forum software by XenForo"
      end

      def meta_description_content
        text_at("//meta[@name='description']/@content")
      end
    end
  end
end