require 'bundler/setup'
require 'erb'
require 'pry'
require 'open-uri'

Bundler.require

require_relative '../lib/models/cl_scraper.rb'
require_relative '../lib/models/cl_query.rb'
require_relative '../lib/models/cl_runner.rb'