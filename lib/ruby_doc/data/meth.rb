class Meth
#========================modules=========================== 
  extend DataExtras #sets/gets @@all
#=================properties===================           
  attr_accessor :name, :url, :description, :type, :classes
#==============================================
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
    self.classes = []
  end
#==============================================
  def self.find(name) 
    self.all.find{|meth| meth.name.downcase == name.downcase}
  end
#==============================================
end
