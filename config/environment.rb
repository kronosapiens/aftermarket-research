require 'bundler/setup'
require 'erb'
require 'pry'
require 'open-uri'

Bundler.require

require_relative '../lib/models/scraper.rb'
require_relative '../lib/models/query.rb'
require_relative '../lib/models/runner.rb'
require_relative '../lib/models/analyzer.rb'