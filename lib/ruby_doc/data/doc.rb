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
  # find meth or doc by title/name
#==============================================
    def self.find(input)
      puts "\nfind Greenlight".green
    end
#==============================================
end
