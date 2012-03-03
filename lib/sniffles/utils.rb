module Sniffles
  module Utils
    def self.absolute_uri(host, path)
      URI.parse(host).merge(URI.parse(path)).to_s
    end
  end
end