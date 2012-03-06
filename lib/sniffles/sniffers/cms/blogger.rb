module Sniffles
  module Sniffers
    class Blogger
      include HTML
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        @output[:found] = blogger?
      end
      
      private
      def blogger?
        meta_generator_content == "blogger"
      end

      def meta_generator_content
        text_at("//meta[@name='generator']/@content")
      end
    end
  end
end