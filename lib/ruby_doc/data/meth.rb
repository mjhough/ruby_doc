class Meth
#=================properties=================== 
#                  X     X          X        X      X           
  attr_accessor :name, :url, :description, :type, :docs
  
  @@all = []
  def self.all; @@all; end
#==============================================
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
    self.docs = []
  end
#==============================================
  def self.find(name)
    self.all.find{|meth| meth.name.downcase == name.downcase}
  end #returns Meth OBJECT
#==============================================
  def self.display(meth_name)
    meth = Meth.find(meth_name)
    # load remaining props to instance 
    Scraper.get_methPage(meth)
    
    puts "Title: " + meth.name.upcase
    puts "Type: " + meth.type.upcase
    
    puts "\nDescription:"
    puts meth.description
    puts "Source: " + meth.url
    
    puts "To Return To" + " Main Menu" + " (Enter " + "'m'" + ")"
    
    input = gets.strip.to_s.downcase
    RubyDoc::CLI.start if input == "m"
    
  end
#==============================================
end
