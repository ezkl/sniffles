require 'typhoeus'

SNIFFER_COUNT = Dir.glob(File.dirname(__FILE__) + "/../../lib/sniffles/sniffers/**/*.rb").count
SNIFFER_GROUP_COUNT = Dir.glob(File.dirname(__FILE__) + "/../../lib/sniffles/sniffers/**").count

def page_body(url)
  Typhoeus::Request.get(url, headers: { 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.68 Safari/537.36'}).body
end

def empty_html_doc
  "<html><head></head><body></body></html>"
end
