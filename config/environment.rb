#====================Requires===================
require 'colorize'
require 'open-uri'
require 'nokogiri'
require_relative './patches'
require_relative '../lib/ruby_doc/version'
require_relative '../lib/ruby_doc/ui/CLI'
require_relative '../lib/ruby_doc/ui/UI'
require_relative '../lib/ruby_doc/data/scrapers'
require_relative '../lib/ruby_doc/data/meth'
require_relative '../lib/ruby_doc/data/klass'
#====================Testing====================
Scraper.load_classes
Scraper.load_methods
Scraper.load_class_doc(Klass.all[2]) 
#===============================================


