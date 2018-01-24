module RubyDoc::CLI
#==================modules===================== 
  class UI 
    extend UIExtras#
    #Inherited Methods: separators, alphaGets,
    #prompt, wError(iN),signature
#============================================== 
    def self.greeting 
      signature#
      mainMenu#
      mainControl#
    end
    
    def self.shuttle(iN)
      case iN
      when "b"
        Doc.paginateALL
      else
        DataExtras.superSEARCH(iN) 
      end
    end
#============================================== 
  end
#==============================================
end 
