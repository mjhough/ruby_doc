class Scraper 
  extend UIExtras 
  #inheriting: loading_message, loading_animation
  
  #See "HELPERS"(line62) for additional methods
#==================Load Docs=================== 
  def self.loadDOCS 
    @counter = 0 #For Loading anim
    loading_message#
    
    html = Nokogiri::HTML(open("https://apidock.com/ruby/browse"))
    container = html.search(".hover_list")
    
    container.search("a").each do |doc|
      name = doc.text
      url = prefix + doc.attribute("href").value
      
      # assigns - Doc :names, :urls
      Doc.new(name, url) if docUniq(name)
      
      @counter += 1 #For Loading anim
      loading_animation#
    end
  end 
#===================DocPage==================== 
  def self.loadDocPage(doc)
    #Scrape1 
    doc_page = Nokogiri::HTML(open(doc.url))
    #prerequisites
    doc_page.search(".description p")[0..1].search("em").remove
    container = doc_page.search("#related")
    container.search("li").search(".related_header").remove
    #============================================================
    
    # assigns - Doc :description, :type
    doc.description = parse(doc_page.search(".description p")[0..1].text)
    doc.type = doc_page.search(".title_prefix span").text
    
    #Scrape2
    container.search("li").map do |m|
      name = m.search("a").text
      url = prefix + m.search("a").attribute("href").value
      
      # assigns - Meth :name, :url >> Doc :methods
      method = Meth.new(name, url) if methUniq(name)
      doc.methods << name if methsUniq(doc.methods, name)
    end
    doc
  end
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