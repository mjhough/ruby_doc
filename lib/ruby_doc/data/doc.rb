class Doc
#==================modules===================== 
  extend DataExtras
  #paginate 
#=================properties=================== 
#                 X      X         X          X      X
  attr_accessor :name, :url, :description, :type, :methods
  @@all = []
  def self.all; @@all; end
#==============================================
  #DocCount = 2403
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
    self.methods = []
  end
#==============================================
  # name downcased already through UI.mainControl
  def self.find(name)
    self.all.find{|doc| doc.name.downcase == name.downcase}
  end #returns Doc OBJECT
#==============================================
  def self.display(doc)
    Scraper.load_doc_page(doc)
    
    puts "Title: " + doc.name.upcase
    puts "Type: " + doc.type.upcase
    
    puts "\nDescription:"
    puts doc.description
    puts "Methods: " + "#{doc.methods.count}"
    puts "Source: " + doc.url
    
    puts "\nTo " + "View Methods " + "For" + " #{doc.name}" + " (Enter " + "'1'" + ")"
    puts "To Return To" + " Main Menu" + " (Enter " + "'m'" + ")"
    
    input = gets.strip.to_s.downcase
    case input #Shuttle
    when "1"
      Doc.listMeths(doc)
    when "m"
      RubyDoc::CLI.start
    end
  end
#==============================================  
  def self.listMeths(doc)
    doc.methods.each_with_index do |meth, index|
      puts "#{index + 1}. " + meth
    end 
    
    puts "\nenter number of item to view"
    input = gets.strip.to_s.downcase
    # rotate
    case input # SHUTTLE
    when "m"
      RubyDoc::CLI.start
    else
      Meth.display(doc.methods[input.to_i-1])
    end
  end
#==============================================
end
