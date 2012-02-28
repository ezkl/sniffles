# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sniffles/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ezekiel Templin"]
  gem.email         = ["zeke@templ.in"]
  gem.description   = %q{Detects popular CMS, Javascript libraries, and other items of interest.}
  gem.summary       = %q{Sniffles helps you determine the platforms and libraries a website is running.}
  gem.homepage      = "http://documentup.com/ezkl/sniffles"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "sniffles"
  gem.require_paths = ["lib"]
  gem.version       = Sniffles::VERSION
  
  gem.add_runtime_dependency("nokogiri", "~> 1.5.0")
  
  gem.add_development_dependency("rspec", "~> 2.8.0")
  gem.add_development_dependency("vcr", "2.0.0.rc2")  
end
