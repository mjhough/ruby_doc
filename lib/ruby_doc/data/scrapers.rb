class Scraper
  # DocCount = 2403
#===================DocURLs====================
  def self.get_DocURLs #Complete[X]
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # SCRAPES :titles, :urls
    container.search("a").each do |doc|
      doc_title = doc.text
      doc_url = "https://apidock.com" + doc.attribute("href").value
    end
  end
#==============================================
  # requires a doc.url
#==================DocPage=====================
  def self.get_docPage(doc_url)
    # load
    doc_page = Nokogiri::HTML(open(doc_url))
    doc_page.search(".description p")[0..1].search("em").remove
    binding.pry
    
    # SCRAPES :description, :type
    
    # binding.pry
  end
#==============================================
end