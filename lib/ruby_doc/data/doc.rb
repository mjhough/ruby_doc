class Doc
#==================modules===================== 
  extend DataExtras
  #paginate, display(doc), listMeths(doc)
#=================properties=================== 
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
  def self.find(name)
    self.all.find{|doc| doc.name.downcase == name.downcase}
  end
#==============================================
end
