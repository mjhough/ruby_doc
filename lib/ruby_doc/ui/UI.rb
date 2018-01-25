module RubyDoc::CLI
#==================modules===================== 
  class UI 
    extend UIExtras#
    #Inherited Methods: separators, alphaGets,
    #prompt, wError(iN),signature
#============================================== 
    def self.greeting 
      mainMenu#
      mainControl#
    end
    
    def self.main_Shuttle(iN) 
      case iN
      when "b"
        DataExtras.paginateALL
      else
        DataExtras.superSEARCH(iN) 
      end
    end
    
    def self.search_Shuttle(iN, matches) 
      case iN
      when "m"
        greeting  
      else
        Doc.display(matches[iN.to_i-1])
      end
    end
    
    def self.meth_Shuttle(iN, doc) 
      DataExtras.displayMeth(doc.methods[iN.to_i-1])
    end
#============================================== 
  end
#==============================================
end 
