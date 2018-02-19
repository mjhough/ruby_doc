class Scraper 
  extend UIExtras 
  #inheriting: loading_message, loading_animation
  
  #See "HELPERS"(line62) for additional methods
                      # CONNECT BOTH SCRAPERS
#===========================Load Classes============================= 
  def self.load_classes
    @counter = 0 #For Loading anim
    loading_message#
    
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.5.0/"))
    container = html.search("#class-index div.entries")
    
    container.search("a").each do |doc| 
      name = doc.text
      url = prefix + doc.attribute("href").value
      
      # assigns - Klass :names, :urls
      Klass.new(name, url) if class_uniq(name)
      
      @counter += 1 #For Loading anim
      loading_animation#
    end
  end 
#===========================Load Methods============================= 
  def self.load_methods
    @counter = 0 #For Loading anim
    loading_message#
    
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.5.0/"))
    container = html.search("#method-index div.entries")
    
    container.search("a").each do |doc| 
      name = doc.text
      url = prefix + doc.attribute("href").value
      
      # assigns - Method :names, :urls
      Meth.new(name, url) if method_uniq(name)
      
      @counter += 1 #For Loading anim
      loading_animation#
    end
  end 
#==============================DocPage=============================== 
  def self.loadDocPage(doc) 
    #Scrape1 
    doc_page = Nokogiri::HTML(open(doc.url))
    #prerequisites
    doc_page.search(".description p")[0..1].search("em").remove
    container = doc_page.search("#related")
    container.search("li").search(".related_header").remove
    
    # assigns - Doc :description, :type
    doc.description = parse(doc_page.search(".description p")[0..1].text)
    doc.type = doc_page.search(".title_prefix span").text
    #========================================== 
    #Scrape2
    container.search("li").map do |m|
      name = m.search("a").text
      url = prefix + m.search("a").attribute("href").value
      
      # assigns - Meth :name, :url >> Doc :methods
      method = Meth.new(name, url) if methUniq(name)
      doc.methods << name if methsUniq(doc.methods, name)
    end
    doc #doc instance
  end
#=============================MethPage=============================== 
  def self.loadMethPage(meth)
    url = Nokogiri::HTML(open(meth.url))
    url.search(".description p")[0..1].search("em").remove
    
    # assigns - Meth :description, :type
    meth.description = parse(url.search(".description p")[0..1].text)
    meth.type = url.search(".title_prefix span").text
  end
#==================================================================== 
                                                             #HELPERS
#==================================================================== 
  def self.class_uniq(name) 
    Klass.all.none?{|klass| klass.name == name}
  end
  
  def self.method_uniq(name) 
    Meth.all.none?{|method| method.name == name}
  end
#==================================================================== 
  def self.parse(des) 
    des.gsub(/[\n]/, ' ').gsub('  ',' ')
  end
  
  def self.methUniq(col,name) 
    col.none?{|meth| meth == name}
  end
  
  def self.prefix 
    "https://ruby-doc.org/core-2.5.0/"
  end
#==================================================================== 
end