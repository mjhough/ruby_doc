module RubyDoc
#============================================== 
  module CLI
#===============Load Init Data================#
    def self.iLoad 
      puts "\nThanks For Using ALPHA™ Ruby Docs!".cyan
      puts "One Moment Please As We Set Things Up\n".cyan
      Scraper.loadDOCS
      start
    end
#============================================== 
    def self.start 
      UI.signature#
      UI.greeting
    end
#============================================== 
  end
#==============================================
end 

