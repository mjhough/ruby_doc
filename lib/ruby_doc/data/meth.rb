class Doc
#=================properties===================
  attr_accessor :name, :url, :description, :type, :docs
  @@all = []
  def self.all; @@all; end
#==============================================
end
