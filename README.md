---
tags: craigslist, aftermarket, online commerce, nokogiri, web scraping
language: ruby
---

# AfterMarket Research

[![Gem Version](https://badge.fury.io/rb/aftermarket_research.png)](http://badge.fury.io/rb/aftermarket_research)
[![Code Climate](https://codeclimate.com/github/kronosapiens/aftermarket_research.png)](https://codeclimate.com/github/kronosapiens/aftermarket_research)

This gem is meant to provide a Command-Line Interface for running simple market research queries on Craigslist.

The gem allows you to specify an area of NYC, a search query, and set parameters for minimum and maximum price (for the search). The program will run a search on Craigslist, collect the pricing data, and perform some basic analyses to return the mean, median, and mode prices for your product in your area.

*NOTE: This gem is for small-scale personal research purposes only. This gem is not intended for any commercial applications.*

## Tips

For better search results, set your price boundaries reasonably close to where you expect the average value to fall. Setting the search window too wide will cause the scraper to gather misleading data. If you're finding an unusual discrepancy between your mean, median, and mode values, consider re-calibrating your search.


## Install and run by typing the following into your command line:

```
$: gem install aftermarket_research
```

```
$: aftermarket_research
```
