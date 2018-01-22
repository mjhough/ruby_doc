class Meth
#=================properties===================
  attr_accessor :name, :url, :description, :type, :docs
  @@all = []
  def self.all; @@all; end
#==============================================
    def self.listALL
      puts "Meth listALL Greenlight".green
    end
#==============================================
end
