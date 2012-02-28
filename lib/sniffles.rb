require 'nokogiri'

require "sniffles/version"

module Sniffles
  def self.sniff(html)
    output = {}
    output[:wordpress] = true if wordpress?(html)
    output[:jquery] = true if jquery?(html)
    output[:quantcast] = true if quantcast?(html)
    
    output
  end
  
  def self.wordpress?(html)
    !!(html =~ /wp-content/i)
  end
  
  def self.jquery?(html)
    !!(html =~ /jQuery/)
  end
  
  def self.quantcast?(html)
    !!(html =~ /\.quantserve\.com\/quant\.js/)
  end
end
