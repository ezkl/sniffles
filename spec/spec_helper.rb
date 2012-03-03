require File.expand_path(File.dirname(__FILE__) + '/../lib/sniffles')
require 'vcr'
require 'typhoeus'

SNIFFER_COUNT = Dir.glob("lib/sniffles/sniffers/**/*.rb").count
SNIFFER_GROUP_COUNT = Dir.glob("lib/sniffles/sniffers/**").count

def page_body(url)
  Typhoeus::Request.get(url).body
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :typhoeus
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.extend VCR::RSpec::Macros  
end
