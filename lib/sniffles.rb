require 'typhoeus'
require 'nokogiri'

require "sniffles/version"

module Sniffles
  def self.sniff(url)
    @url = url
  end
  
  def self.url
    @url
  end
end
