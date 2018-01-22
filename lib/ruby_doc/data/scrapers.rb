class Scraper
#==================Load Docs===================
  def self.loadDOCS #[X]
    # load
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    # SCRAPES :titles, :urls
    container.search("a").each do |doc|
      doc_title = doc.text
      docURL = "https://apidock.com" + doc.attribute("href").value
      
      Doc.new(doc_title, docURL) if uniq(doc_title)
    end
  end #returns [2403 Objs]
#==============================================
  # requires a doc.url
#==================DocPage=====================
  def self.get_docPage(docURL) #Complete[X] for Doc.list_all
    # load
    doc_page = Nokogiri::HTML(open(docURL))
    doc_page.search(".description p")[0..1].search("em").remove #description prerequisite
    scrape = doc_page.search(".description p")[0..1].text #description prerequisite
    container = doc_page.search("#related") #methods prerequisite
    container.search("li").search(".related_header").remove #methods prerequisite
    
    # SCRAPES :description, :type, methods (with names and urls)
    description = parse(scrape)
    type = doc_page.search(".title_prefix span").text
    
    container.search("li").map do |meth|
      meth_name = meth.search("a").text
      methURL = "https://apidock.com" + meth.search("a").attribute("href").value
    end
    
    
    # binding.pry
  end
#==============================================
  # requires a meth.url (=> doc.methods[meth :url here!])
#==================MethPage====================
  def self.get_methPage(methURL) #[]
    # load
    methURL = Nokogiri::HTML(open(methURL))
    methURL.search(".description p")[0..1].search("em").remove #description prerequisite
    scrape = methURL.search(".description p")[0..1].text #description prerequisite
    
    # SCRAPES :description, :type
    description = parse(scrape)
    type = methURL.search(".title_prefix span").text
    binding.pry
  end
#==============================================
################ Helpers ###################
  def self.parse(des)
    des.gsub(/[\n]/, ' ').gsub('  ',' ')
  end
  
  def self.uniq(title)
    Doc.all.none?{|doc| doc.title == title}
  end
############################################
end