require 'bundler/setup'
require 'erb'
require 'pry'
require 'open-uri'

Bundler.require

require_relative '../lib/scraper.rb'
require_relative '../lib/query.rb'
require_relative '../lib/runner.rb'
require_relative '../lib/analyzer.rb'