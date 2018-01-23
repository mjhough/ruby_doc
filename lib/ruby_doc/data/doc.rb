class Doc
#==================modules===================== 
  extend DocExtras
  #paginate 
#=================properties=================== 
#                 X      X         X          X
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
  def self.find(input)
    puts "\nfind Greenlight".green
  end
#==============================================
  def self.display(doc)
    Scraper.load_doc_page(doc)
    
    puts "Title: " + doc.name.upcase
    puts "Type: " + doc.type.upcase
    
    puts "\nDescription:"
    puts doc.description
    puts "Methods: " + "#{doc.methods.count}"
    puts "Source: " + doc.url
    binding.pry
  end
#==============================================
end
