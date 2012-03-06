module Sniffles
  module Sniffers
    class Phpbb
      include HTML
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        @output[:found] = phpbb?
      end
      
      private
      def phpbb?
        @doc.text.include?("Powered by phpBB") && phpbb_meta?
      end    
      
      def phpbb_meta?
        !@doc.xpath("//meta[@name='resource-type']").empty? && !@doc.xpath("//meta[@name='distribution']").empty?
      end
    end
  end
end