require 'typhoeus'

SNIFFER_COUNT = Dir.glob(File.dirname(__FILE__) + "/../../lib/sniffles/sniffers/**/*.rb").count
SNIFFER_GROUP_COUNT = Dir.glob(File.dirname(__FILE__) + "/../../lib/sniffles/sniffers/**").count

def page_body(url)
  Typhoeus::Request.get(url).body
end

def empty_html_doc
  "<html><head></head><body></body></html>"
end