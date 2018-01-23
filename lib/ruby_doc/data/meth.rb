class Meth
#=================properties===================           
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
  end
#==============================================
end
