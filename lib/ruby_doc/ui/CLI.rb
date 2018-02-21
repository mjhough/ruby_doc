module RubyDoc
#======================================================== 
  module CLI
#====================Load Init Data======================
    def self.init_load 
      puts "\nThanks For Using ALPHA™ Ruby Docs!".cyan
      puts "One Moment Please As We Set Things Up\n".cyan
      Scraper.load_classes and Scraper.load_methods
      start
    end
#======================================================== 
    def self.start 
      UI.signature#
      UI.greeting
    end
#======================================================== 
  end
#========================================================
end 

