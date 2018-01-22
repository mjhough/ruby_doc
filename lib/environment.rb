#===========Requires==========
require 'require_all'
require 'colorize'
require 'nokogiri'
require 'open-uri'
require 'pry'
require_all 'bin'
require_all 'lib'
#============Patch============
def x; exit!; end #Quit Exit

#=======================Load Docs==========================
puts "Initial Loading!".cyan
# LOAD_FILE_HERE

#========================Testing=========================== 
# Preload into environment to quick pry
Scraper.place_holder
# binding.pry