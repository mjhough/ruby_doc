#===========Requires==========
require 'require_all'
require 'colorize'
require 'pry'
require_all 'bin'
require_all 'lib'
#===========Scraping==========
require 'open-uri'
require 'nokogiri'
#======Monkey Patch===========
def x; exit!; end #Quit Exit

#==================Load Init Data====================#
puts "\nThanks For Using ALPHA™ Ruby Docs!".cyan
puts "One Moment Please As We Set Things Up\n".cyan
Scraper.loadDOCS
#====================================================#
