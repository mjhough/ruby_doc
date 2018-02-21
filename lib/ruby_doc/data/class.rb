class Klass
#=======================properties========================= 
  attr_accessor :type, :name, :url, :short, :doc, :methods
  # complete     [X]     [X]   [X]    [X]    [X]     [X]
#----------------------------------------------------------  
  @@all = []
  def self.all; @@all; end 
#==========================================================
  # count = 125
  def initialize(type, name, url) 
    self.type = type
    self.name = name
    self.url = url
    @@all << self
    self.methods = []
  end
#==========================================================
end

