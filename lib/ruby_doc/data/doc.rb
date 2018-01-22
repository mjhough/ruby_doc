class Doc
#=================properties===================
  attr_accessor :title, :url, :description, :type, :methods
  @@all = []
  def self.all; @@all; end
#==============================================
    def self.listALL
      puts "Doc listALL Greenlight".green
    end
#==============================================
end
