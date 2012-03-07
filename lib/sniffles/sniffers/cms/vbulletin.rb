module Sniffles
  module Sniffers
    class Vbulletin
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
          parse_feed
        end
      end
      
      private
      def found?
        !!(js_initialization? || meta_generator_content =~ /vBulletin/)
      end
      
      def parse_feed
        @output[:feed] = text_at("//link[@type='application/rss+xml']/@href")
      end
      
      def parse_version
        if meta_generator_content
          @output[:version] = (meta_generator_content.match(/([\d]+\.[\d]+\.[\d]+)/) ? $1 : false)
        else
          @output[:version] = false
        end
      end
      
      def meta_generator_content
        text_at("//meta[@name='generator']/@content")
      end
      
      def js_initialization?
        @doc.xpath("//script[contains(text(),'vBulletin_init()')]").any?
      end
    end
  end
end