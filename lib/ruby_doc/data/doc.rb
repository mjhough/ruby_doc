class Klass
#========================modules=========================== 
  extend DataExtras #sets/gets @@all
  #inheriting: paginate, display(doc), listMeths(doc)
#=======================properties========================= 
  attr_accessor :name, :url, :description, :type, :methods
#==========================================================
  #KlassCount = 125
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
    self.methods = []
  end
#==========================================================
end

