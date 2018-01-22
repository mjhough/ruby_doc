#===========Requires==========
require 'require_all'
require 'colorize'
require 'pry'
require_all 'bin'
require_all 'lib'
#===========Scraping==========
require 'open-uri'
require 'nokogiri'
#============Patch============
def x; exit!; end #Quit Exit


#=================Load Docs====================
puts "Initial Loading!".cyan
# LOAD_FILE_HERE
Scraper.loadDOCS
#==================Testing=====================
# Preload into environment to quick pry
