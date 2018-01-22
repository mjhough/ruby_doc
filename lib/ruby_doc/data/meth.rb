class Meth
#=================properties=================== 
#                  X     X                          X           
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
    def self.listALL 
      puts "Meth listALL Greenlight".green
    end
#==============================================
end
