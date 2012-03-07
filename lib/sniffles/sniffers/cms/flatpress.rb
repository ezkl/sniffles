module Sniffles
  module Sniffers
    class Flatpress
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
        !!(meta_generator_content =~ /FlatPress/)
      end
      
      def parse_version
        version_capture = (meta_generator_content.match /FlatPress fp\-([\d]+\.[\d]+\.[\d]+)/)
        @output[:version] = (version_capture ? version_capture[1] : false)
      end

      def meta_generator_content
        text_at("//meta[@name='generator']/@content")
      end
    end
  end
end