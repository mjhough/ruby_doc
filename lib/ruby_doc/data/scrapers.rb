class Scraper
#==================Load Docs===================
  def self.loadDOCS
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    container.search("a").each do |doc|
      doc_name = doc.text
      docURL = prefix + doc.attribute("href").value
      
      # assign
      Doc.new(doc_name, docURL) if docUniq(doc_name)
    end
  end #Doc :names, :urls
#==================DocPage=====================
  def self.load_doc_page(doc)
    doc_page = Nokogiri::HTML(open(doc.url))
    #prerequisites
    doc_page.search(".description p")[0..1].search("em").remove 
    scrape = doc_page.search(".description p")[0..1].text
    container = doc_page.search("#related")
    container.search("li").search(".related_header").remove
    #============================================================
    # assignments
    doc.description = parse(scrape)
    doc.type = doc_page.search(".title_prefix span").text
    
    container.search("li").map do |m|
      meth_name = m.search("a").text
      methURL = prefix + m.search("a").attribute("href").value
      
      # assignments
      method = Meth.new(meth_name, methURL) if methUniq(meth_name)
      doc.methods << meth_name if methsUniq(doc.methods,meth_name)
      method.docs << doc.name if docsUniq(method.docs,doc.name)
    end #Doc :description, :type, :methods
  end #Meth :name, :url, :docs
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
  
  def self.docUniq(name)
    Doc.all.none?{|doc| doc.name == name}
  end
  
  def self.methUniq(name)
    Meth.all.none?{|meth| meth.name == name}
  end
  
  def self.docsUniq(col,name)
    col.none?{|meth| meth == doc.name}
  end
  
  def self.methsUniq(col,name)
    col.none?{|meth| meth == meth_name}
  end
  
  def self.prefix
    "https://apidock.com"
  end
############################################
end