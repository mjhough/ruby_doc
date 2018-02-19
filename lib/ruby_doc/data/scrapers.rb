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
#==========================Load Class Doc============================ 
  def self.load_class_doc(klass) 
    html = Nokogiri::HTML(open(klass.url))
    
    # description
    description = html.search("#description")
    
    short = description.search("p")[0].text + expand #assign ready
    
    full = ""
    description.search("p, pre, h2").each {|p| full << p.text + "\n\n"} 
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
  
  def self.expand
  "\nTo View Full Documentation Enter 'expand'".yellow
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