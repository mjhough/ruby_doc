class Scraper
  # DocCount = 2403
#=================place_holder==================
  def self.get_docPages
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # scrapes :titles, :urls
    container.search("a").each do |doc|
      doc_title = doc.text
      doc_url = "https://apidock.com" + doc.attribute("href").value
      binding.pry
    end
    # binding.pry
  end
#==============================================
#==============================================
end