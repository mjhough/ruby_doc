module RubyDoc::CLI
#==================modules=====================
  class UI
    extend UIExtras#
    #separators
#==============================================
    def self.greeting
      puts "\n                 SIGNATURE GOES HERE".black
      separatorL#
     
      puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
      puts "try to find a match in my database for you.".cyan
      separatorR#
      
      puts "\You can also type".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
      
      print "\n If You're Searching... Single Word Inputs Only Please ".colorize(color: :white, background: :cyan)
    end
#==============================================
    def self.mainControl
      print " >> ".cyan
      input = gets.strip.to_s.downcase
      
      case input
      when "b"
        Doc.paginateALL
      else
        DataExtras.superSEARCH(input) 
      end
    end
#==============================================    
  end
#==============================================
end 
