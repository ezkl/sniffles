# Sniffles
!["Travis Build Status"](https://secure.travis-ci.org/ezkl/sniffles.png?branch=master)

## Description
Sniffles parses HTML pages and searches for common patterns suggesting a page is using popular CMS, CSS, and JS libraries.

## Installation
Rubygems:

`gem install sniffles`

Bundler:

`gem 'sniffles'`

## Usage
    require 'sniffles'
    require 'typhoeus' # Optional: Use your favorite HTTP client.
    
    response = Typhoeus::Request.get("http://www.wordpress.com/")
    Sniffles.sniff(response.body) # => {wordpress: true, jquery: true, quantcast: true}