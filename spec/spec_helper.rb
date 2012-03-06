require File.expand_path(File.dirname(__FILE__) + '/../lib/sniffles')
require File.expand_path(File.dirname(__FILE__) + '/../spec/support/helpers')
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :typhoeus
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.extend VCR::RSpec::Macros  
end
