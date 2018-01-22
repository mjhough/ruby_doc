class Meth
#=================properties=================== 
#                            
  attr_accessor :name, :url, :description, :type, :docs
  @@all = []
  def self.all; @@all; end
#==============================================
  def initialize(name, url) 
    self.name = name
    self.url = url
    @@all << self
  end
#==============================================
    def self.listALL 
      puts "Meth listALL Greenlight".green
    end
#==============================================
end
