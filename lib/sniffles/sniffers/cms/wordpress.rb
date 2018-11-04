module Sniffles
  module Sniffers
    class Wordpress
      include HTML
      attr_accessor :doc
      attr_reader :name, :group, :output, :response

      def initialize(response_body)
        @output = {}
        parse(response_body) && process_document
      end

      def process_document
        if @output[:found] = found?
          parse_version
          parse_feed
          parse_theme
          parse_pingback
        end
      end

      private
      def found?
        @doc.xpath('//link[contains(@href,"wp-content")]').any?
      end

      def parse_feed
        @output[:feed] = text_at("//link[@rel='alternate' and @type='application/rss+xml']/@href")
      end

      def parse_theme
        theme_uri = text_at("//link[@rel='stylesheet' and contains(@href,'wp-content/themes/')][1]/@href")
        @output[:theme] = theme_uri && clean_theme_uri(theme_uri)&.fetch(1)
      end

      def parse_version
        version_meta_tag = text_at("//meta[@name='generator']/@content")
        @output[:version] = version_meta_tag

        if @output[:version] && version = extract_version(version_meta_tag)
          @output[:version] = version[1]
        end
      end

      def parse_pingback
        @output[:pingback] = text_at("//link[@rel='pingback']/@href")
      end

      def clean_theme_uri(uri)
        /wp-content\/themes\/([^\/]*)\//i.match uri
      end

      def extract_version(string)
        /([\d]+\.[\d]+[\.]?[\d]?)/.match string
      end
    end
  end
end
