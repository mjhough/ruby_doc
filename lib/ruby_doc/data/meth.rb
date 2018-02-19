class Meth
#=========================modules============================ 
  extend DataExtras #sets/gets @@all
#============================================================           
  attr_accessor :name, :url, :description, :classes
#============================================================
  # count 1839
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
    self.classes = []
  end
#============================================================
  def self.find_by(url) 
    Meth.all.find{|m| m.url == url}
  end
#============================================================
end
