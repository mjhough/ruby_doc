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
      
      if input == "b"
        browseControl
      end
    end
#==============================================
    def self.browseControl
      puts "\nbrowseControl Greenlight".green
      puts "\nTo Browse Docs (Enter '1')"
      puts "To Browse Methods (Enter '2')"
      puts "\nBack to Main Menu (Enter 'm')"
    end
#==============================================    
  end
#==============================================
end 
