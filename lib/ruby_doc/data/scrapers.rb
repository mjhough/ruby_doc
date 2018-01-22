class Scraper
  # DocCount = 2403
#=================place_holder==================
  def self.place_holder
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # scrape
    propcheck = []
    container.search("a").each do |doc|
      doc_title = doc.text
      # binding.pry
      propcheck << doc_title
    end
    binding.pry
  end
#==============================================
end