class Doc
#=================properties===================
  attr_accessor :title, :url, :description, :type, :methods
  @@all = []
  def self.all; @@all; end
#==============================================
  #:titles, :urls [x] (DocCount = 2403)
  def initialize(title, url)
    self.title = title
    self.url = url
    @@all << self
  end
#==============================================
  # iterate @@all with index  
#==============================================
  def self.listALL
    puts "Doc listALL Greenlight".green
  end
#==============================================
  # find meth or doc by title/name
#==============================================
  def self.find(input)
    puts "\nfind Greenlight".green
  end
#==============================================
end
