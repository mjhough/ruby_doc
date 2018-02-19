class Meth
#=========================modules============================ 
  extend DataExtras #sets/gets @@all
#============================================================           
  attr_accessor :name, :url, :doc
  # complete     [X]    [X]   [X] 
#============================================================
  # count 1839
  def initialize(name, url) 
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
