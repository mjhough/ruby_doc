class Scraper
#=================place_holder==================
  def self.place_holder
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # scrape
    container.search("a").each do |doc|
      doc_title = doc.text
      binding.pry
    end
  end
#==============================================
end