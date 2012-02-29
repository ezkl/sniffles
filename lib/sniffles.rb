require 'nokogiri'

require "sniffles/version"

module Sniffles
  def self.sniff(html)
    doc = Nokogiri::HTML::parse(html)
    
    output = {}
    output[:wordpress] = true if wordpress?(doc)
    output[:jquery] = true if jquery?(html)
    output[:quantcast] = true if quantcast?(html)
    output[:mixpanel] = true if mixpanel?(html)
    
    output
  end
  
  def self.wordpress?(doc)
    !doc.xpath('.//link[contains(@href,"wp-content")]').empty?
  end
  
  def self.jquery?(html)
    !!(html =~ /jQuery/)
  end
  
  def self.quantcast?(html)
    !!(html =~ /\.quantserve\.com\/quant\.js/)
  end

  def self.mixpanel?(html)
    !!(html =~ /api.mixpanel.com\S+mixpanel.js/)
  end
end
