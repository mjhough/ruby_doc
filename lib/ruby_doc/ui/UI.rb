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
  end
#==============================================
end 
