module Sniffles
  module Sniffers
    class Sitefinity
      include Text
      
      attr_accessor :doc
      attr_reader :output
      
      def initialize(response_body)
        @output = {}        
        parse(response_body) && process_document
      end
      
      def process_document
        if @output[:found] = found?
          sitefinity_version
        end
      end
      
      private
      def found?
        match?(/content="Sitefinity/)
      end    
      
      def sitefinity_version
        @output[:version] = capture(/content="Sitefinity\s([\d*].[\d+])/)
      end
    end
  end
end
