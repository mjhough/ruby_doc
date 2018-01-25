module RubyDoc::CLI
#==================modules===================== 
  class UI 
    extend UIExtras#
#============================================== 
    def self.greeting 
      mainMenu#
      mainControl#
    end
    
    def self.main_Shuttle(iN) 
      iN == "b" ? DataExtras.paginateALL : DataExtras.superSEARCH(iN)
    end
    
    def self.search_Shuttle(iN, matches)
      iN == "m" ? greeting : Doc.display(matches[iN.to_i-1])
    end
    
    def self.meth_Shuttle(iN, doc) 
      DataExtras.displayMeth(doc.methods[iN.to_i-1])
    end
#============================================== 
  end
end 
