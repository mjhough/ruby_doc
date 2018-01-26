require_relative './ui_extras'
require_relative '../data/data_extras.rb'
#===============requires above================= 
module RubyDoc::CLI
#==================modules===================== 
  class UI 
    extend UIExtras#
    #inheriting: mainMenu, mainControl
    extend DataExtras
    #inheriting: paginateALL, superSEARCH(),
    #displayMeth(), display()
#============================================== 
    def self.greeting 
      mainMenu#
      mainControl#
    end
    
    def self.main_Shuttle(iN) 
      iN == "b" ? paginateALL : superSEARCH(iN)
    end
    
    def self.search_Shuttle(iN, matches)
      iN == "m" ? greeting : display(matches[iN.to_i-1])
    end
    
    def self.meth_Shuttle(iN, doc) 
      displayMeth(doc.methods[iN.to_i-1])
    end
#============================================== 
  end
end 
