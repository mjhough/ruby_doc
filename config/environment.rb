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
#====================DataBase===================
$DocDB = []
#====================Testing====================
# Scraper.load_classes
# Scraper.load_methods
#===============================================