module Sniffles
  module Text
    def parse(text)
      @doc = text
    end

    def match?(pattern)
      !!(pattern.match(@doc))
    end

    def capture(pattern)
      (captures = pattern.match(@doc)) ? captures[1] : false
    end
  end
end
