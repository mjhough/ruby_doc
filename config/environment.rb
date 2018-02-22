#====================Requires===================
require 'colorize'
require 'open-uri'
require 'nokogiri'
require_relative './patches'
require_relative '../lib/ruby_doc/version'
#======================Cli======================
require_relative '../lib/ruby_doc/cli/cli'
require_relative '../lib/ruby_doc/cli/ui'
#=====================Data======================
require_relative '../lib/ruby_doc/data/class'
require_relative '../lib/ruby_doc/data/method'
require_relative '../lib/ruby_doc/data/scraper'
require_relative '../lib/ruby_doc/data/data_processor'
#====================DataBase===================
$DocDB = []
#====================Testing====================
Scraper.load_classes
Scraper.load_methods
# Meth.all.each{|m|puts m.name}
# Pry.start
# abort
# Scraper.load_methods
#===============================================