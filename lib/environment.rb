require 'bundler/setup'
require 'open-uri'

Bundler.require

require_relative 'scraper.rb'
require_relative 'query.rb'
require_relative 'runner.rb'
require_relative 'analyzer.rb'