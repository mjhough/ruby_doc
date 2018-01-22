class Scraper
################ Helper ####################
def self.dParse(des)
  des.gsub(/[\n]/, ' ').gsub('  ',' ')
end
############################################
#===================DocURLs====================
  def self.get_DocURLs #Complete[X]
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # SCRAPES :titles, :urls (DocCount = 2403)
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
    dScrape = doc_page.search(".description p")[0..1].text
    
    # SCRAPES :description, :type
    description = dParse(dScrape)
    type = doc_page.search(".title_prefix span").text
    binding.pry
    
    
  end
#==============================================
end