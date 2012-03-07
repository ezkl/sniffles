# Sniffles
## Description
Sniffles parses HTML pages and searches for common patterns suggesting a page is using popular CMS, CSS, and JS libraries.

**Work in Progress!**

## Installation
Rubygems:

`gem install sniffles`

Bundler:

`gem 'sniffles'`

## Usage
    require 'sniffles'
    require 'typhoeus' # Optional: Use your favorite HTTP client.
    
    response = Typhoeus::Request.get("http://www.squidoo.com/")
    
You can pass in a single sniffer:

    Sniffles.sniff(response.body, :google_analytics) 
    # => { :google_analytics=> { :found=>true, :ua=>"UA-185209-2" } }

Or multiple sniffers:

    Sniffles.sniff(response.body, :google_analytics, :kissmetrics)
    # => { :google_analytics=> { :found=>true, :ua=>"UA-185209-2"}, :kissmetrics=>{:found=>false} }
    
Or an entire group of sniffers:

    Sniffles.sniff(response.body, :analytics)
    # => {:chartbeat=>{:found=>false},
    # :clicky=>{:found=>false},
    # :google_analytics=>{:found=>true, :ua=>"UA-185209-2"},
    # :kissmetrics=>{:found=>false},
    # :mixpanel=>{:found=>true},
    # :quantcast=>{:found=>true}}

## Sniffers (v0.1.2)
### Advertising
* AdMeld
* AdSense
* BuySellAds
* Casale

### Analytics
* ChartBeat
* Clicky
* Google Analytics
* KISSMetrics
* MixPanel
* Quantcast

### CMS
* Blogger
* CS-Cart
* MovableType
* osCommerce
* phpBB
* Posterous
* Tumblr
* Vanilla
* vBulletin
* WordPress
* XenForo
* ZenCart

### Javascript
* jQuery