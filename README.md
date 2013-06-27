# Sniffles
## Description
Sniffles parses HTML pages and searches for common patterns suggesting a page is using a popular CMS or advertising platform as well as CSS and JS libraries.

The master branch is continuously tested against Rubies 1.8.7, 1.9.2, and 1.9.3 thanks to the fantastic [Travis-CI](http://travis-ci.org/#!/ezkl/sniffles).

Current CI status: [![Build Status](https://secure.travis-ci.org/ezkl/sniffles.png?branch=master)](http://travis-ci.org/ezkl/sniffles)


### What is a sniffer?
This library uses the term **sniffer** to refer to a pattern that determines where a page is using a particular platform or library. A sniffer may also include methods to extract other metadata once a platform or library has been identified.

### Work in progress!
Sniffles should be considered a work in progress. Many of the matching patterns are little more than regular expressions matching commonly found "Powered by" text. 

If you find a bug or want to add a feature to a sniffer, [open an issue](https://github.com/ezkl/sniffles/issues/new)! The URL of an example page that Sniffles misidentifies is help. Pull requests are, of course, greatly appreciated.

## Installation
Rubygems:

`gem install sniffles`

Bundler:

`gem 'sniffles'`

## Usage
```ruby
require 'sniffles'
require 'typhoeus' # Optional: Use your favorite HTTP client.

response = Typhoeus::Request.get("http://www.squidoo.com/")
```

You can pass in a single sniffer:

```ruby
Sniffles.sniff(response.body, :google_analytics) 
# => { :google_analytics=> { :found=>true, :ua=>"UA-185209-2" } }
```

Or multiple sniffers:

```ruby
Sniffles.sniff(response.body, :google_analytics, :kissmetrics)
# => { :google_analytics=> { :found=>true, :ua=>"UA-185209-2"}, :kissmetrics=>{:found=>false} }
```

Or an entire group of sniffers:

```ruby
Sniffles.sniff(response.body, :analytics)
# => {:chartbeat=>{:found=>false},
# :clicky=>{:found=>false},
# :google_analytics=>{:found=>true, :ua=>"UA-185209-2"},
# :kissmetrics=>{:found=>false},
# :mixpanel=>{:found=>true},
# :quantcast=>{:found=>true}}
```

## Sniffers ([HEAD](https://github.com/ezkl/sniffles/tree/master))
Here are a list of currently implemented sniffers, grouped by category. You can see a list of unimplemented sniffers by [filtering issues by "sniffer"](https://github.com/ezkl/sniffles/issues?labels=sniffer&state=open).

### Advertising
* AdMeld
* AdSense
* BuySellAds
* Casale
* GumGum
* Kontera
* TheDeck
* TribalFusion

### Analytics
* ChartBeat
* Clicky
* Google Analytics
* Facebook Insights
* KISSMetrics
* MixPanel
* Piwik
* Quantcast

### CMS
* BigCommerce
* Blogger
* CS-Cart
* Drupal
* FlatPress
* Invision
* Joomla
* Magento
* MovableType
* MyBB
* osCommerce
* phpBB
* Posterous
* PrestaShop
* Shopify
* Sitefinity
* Tumblr
* TypePad
* Vanilla
* vBulletin
* WordPress
* Xcart
* XenForo
* ZenCart

### Javascript
* jQuery

## Contributors
For a complete list see [github](https://github.com/ezkl/sniffles/contributors).

### Special Thanks 
* [Jake Austwick](https://github.com/JakeAustwick)
* [dchuk](https://github.com/dchuk)
