module RubyDoc::CLI
#==================modules=====================
  class UI
    extend UIExtras#
    #Inherited Methods: separators, alphaGets,
    #prompt
#==============================================
    def self.greeting
      sepR#
      puts "\n                 SIGNATURE GOES HERE".black
      sepL#
      puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
      puts "try to find a match in my database for you.".cyan
      sepR#
      puts "\You can also type".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
      print "\n If You're Searching... Single Word Inputs Only Please ".colorize(color: :white, background: :cyan)
    end
#==============================================
    def self.mainControl
      prompt#
      iN = alphaGets#
      
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
