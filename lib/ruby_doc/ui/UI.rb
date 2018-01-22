module RubyDoc::CLI
#==============================================
  module UI
#==============================================
    def self.greeting
      puts "UI Greenlight".green
      puts "\nEnter a word associated with the Ruby Language & I will "
      puts "try to find a match in my database for you."
      puts "\nYou can also type 'b' to browse instead. Happy Hunting!"
    end
#==============================================
    def self.mainControl
      puts "mainControl Greenlight".green
      input = gets.strip.to_s.downcase
      puts "input #{input} downcase Greenlight".green
      
      if input == "b"
        browseControl
      end
    end
#==============================================
    def self.browseControl
      puts "\nbrowseControl Greenlight".green
    end
#==============================================    
  end
#==============================================
end 
