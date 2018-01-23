#===========Requires==========
require 'require_all'
require 'colorize'
require 'pry'
require_all 'bin'
require_all 'lib'
#===========Scraping==========
require 'open-uri'
require 'nokogiri'
#===========Patches===========
def x; exit!; end #Quit Exit


#==================Load Init Data====================#
puts "\nALPHACODING™ Thanks For Using Ruby Docs!".cyan
puts "One Moment Please As I Set Things Up\n".cyan
Scraper.loadDOCS
#====================================================#
