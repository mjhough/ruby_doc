class Meth
#============================================================           
  attr_accessor :type, :name, :url, :doc
  # complete     [X]     [X]   [X]   [X]
#----------------------------------------------------------  
  @@all = []
  def self.all; @@all; end 
#============================================================
  # count 1839
  def initialize(type, name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
  end
#============================================================
  def self.find_by(url) 
    Meth.all.find{|m| m.url == url}
  end
#============================================================
end
