module Sniffles
  module HTML
    def parse(html)
      @doc = Nokogiri::HTML(html)
    end

    def text_at(pattern)
      if (nodes = @doc.search(pattern)).any?
        nodes.map(&:value).uniq.first
      else
        false
      end
    end

    def text_match?(pattern, text)
      (@doc.search(pattern).text == text)
    end
  end
end
