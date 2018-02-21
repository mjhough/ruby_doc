#==================requires==================== 
# require_relative './ui_extras'
require_relative '../data/data_extras.rb'
#============================================== 
module RubyDoc::CLI
#===================Start======================
  def self.start 
    puts "\nThanks For Using ALPHA™ Ruby Docs!".cyan
    puts "One Moment Please As We Set Things Up\n".cyan
    Scraper.load_classes and Scraper.load_methods
    UI.signature
    UI.mainMenu
    UI.mainControl
  end
  
  def self.main_Shuttle(iN) 
      case iN 
      when "b" 
        paginateALL 
      when "exit!"
        exit!
      else
        super_search(iN)
      end
    end
    
    def self.search_Shuttle(iN, matches) 
      iN == "m" ? greeting : display(matches[iN.to_i-1])
    end
    
    def self.meth_Shuttle(iN, doc) 
      displayMeth(doc.methods[iN.to_i-1])
    end   
#============================================== 
end 
