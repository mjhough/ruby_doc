class Scraper
#=================place_holder==================
  def self.place_holder
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    binding.pry
  end
#==============================================
end