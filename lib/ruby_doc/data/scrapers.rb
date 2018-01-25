class Scraper 
  extend UIExtras 
  #loading_message, loading_animation
#==================Load Docs=================== 
  def self.loadDOCS
    @counter = 0 #For Loading anim
    self.loading_message#
    
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    container.search("a").each do |doc|
      doc_name = doc.text
      docURL = prefix + doc.attribute("href").value
      
      # assign
      Doc.new(doc_name, docURL) if docUniq(doc_name)
      
      @counter += 1 #For Loading anim
      self.loading_animation#
    end
  end #Doc :names, :urls
#===================DocPage==================== 
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
    end #Doc :description, :type, :methods
    doc
  end #Meth :name, :url, :docs
  #returns doc OBJECT 
#==================MethPage==================== 
  def self.get_methPage(meth) #[] 
    # load
    methURL = Nokogiri::HTML(open(meth.url))
    methURL.search(".description p")[0..1].search("em").remove #description prerequisite
    scrape = methURL.search(".description p")[0..1].text #description prerequisite
    
    # assignments
    meth.description = parse(scrape)
    meth.type = methURL.search(".title_prefix span").text
  end #Meth :description, :type
#==============================================
                                       #HELPERS
#============================================== 
  def self.parse(des) 
    des.gsub(/[\n]/, ' ').gsub('  ',' ')
  end
  
  def self.docUniq(name) 
    Doc.all.none?{|doc| doc.name == name}
  end
  
  def self.methUniq(name) 
    Meth.all.none?{|meth| meth.name == name}
  end
  
  def self.methsUniq(col,name) 
    col.none?{|meth| meth == name}
  end
  
  def self.prefix 
    "https://apidock.com"
  end
end