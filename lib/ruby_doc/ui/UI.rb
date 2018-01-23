module RubyDoc::CLI
#==============================================
  module UI
#==============================================
    def self.greeting
      puts "\nEnter a word associated with the Ruby Language & I will "
      puts "try to find a match in my database for you."
      puts "\nYou can also type 'b' to browse instead. Happy Hunting!"
    end
#==============================================
    def self.mainControl
      input = gets.strip.to_s.downcase
      puts "input #{input} downcase Greenlight".green
      
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
