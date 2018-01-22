class Doc
#==================modules===================== 
  extend DocExtras
  #paginate 
#=================properties=================== 
#                  X      X     
  attr_accessor :title, :url, :description, :type, :methods
  @@all = []
  def self.all; @@all; end
#==============================================
  #DocCount = 2403
  def initialize(title, url) 
    self.title = title
    self.url = url
    @@all << self
  end
#==============================================
  def self.find(input)
    puts "\nfind Greenlight".green
  end
#==============================================
  
#==============================================
end
