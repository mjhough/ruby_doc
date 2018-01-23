class Meth
#=================properties=================== 
#                  X     X                          X           
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
  
  def self.listALL
    Meth.all.each_with_index do |meth, index|
      puts "#{index + 1}. " + meth.name
    end 
    
    puts "\nenter number of item to view"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "m"
      RubyDoc::CLI.start
    else
      Meth.display(Doc.all[input.to_i-1])
    end
  end
#==============================================
  def self.display(input)
    puts "\nmeth display Greenlight".green
  end
#==============================================
  def self.find(input)
    puts "\nfind Greenlight".green
  end
#==============================================
end
