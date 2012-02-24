source 'https://rubygems.org'

# Specify your gem's dependencies in sniffles.gemspec
gemspec

group :development, :test do
  gem 'guard-rspec'
end

require 'rbconfig'

if RbConfig::CONFIG['target_os'] =~ /darwin/i
  gem 'growl', :require => false
end
