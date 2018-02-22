class Scraper < UI 
  
  #See "HELPERS"(line62) for additional methods
                      # CONNECT BOTH SCRAPERS
#===========================Load Classes============================= 
  def self.load_classes 
    @counter = 0 #For Loading anim
    loading_message#
    
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.3/"))
    icontainer = html.search("#class-index .entries")
    
    icontainer.search("p").each do |li| 
      name = li.search("a").text
      url = prefix + li.search("a")[0]["href"]
      type = li["class"].capitalize
      
      # assigns - Klass :names, :urls
      doc = Klass.new(type, name, url) if class_uniq(url)
      # keeps copy in DocDB
      $DocDB << doc if doc_uniq(url)
    end  
  end 
#===========================Load Methods============================= 
  def self.load_methods 
    html = Nokogiri::HTML(open("https://ruby-doc.org/core-2.4.3/"))
    icontainer = html.search("#method-index .entries")
    
    icontainer.search("a").each do |li|
      name = li.text
      url = prefix + li["href"]
      type = "Method"
      
      # assigns - Method :names, :urls
      doc = Meth.new("Method", name, url) if method_uniq(url) 
      # keeps copy in DocDB
      $DocDB << doc if doc_uniq(name)
      
      @counter += 1 #For Loading anim
      loading_animation#
    end
  end 
#==========================Load Class Doc============================ 
  def self.load_class_doc(doc) 
    html = Nokogiri::HTML(open(doc.url))
#-------------------------------------------------------------------- 
    # documentation
    container = html.search("#description")
    
    short = container.search("p")[0].text + expand
    
    description = "" 
    container.search("p, pre, h2").each {|p| description << p.text + "\n\n"} 
    
    # assign 
    doc.short = short
    doc.description = description
#-------------------------------------------------------------------- 
    # methods
    methods = html.search("ul.link-list a")
    
    methods.each do |m| 
      url = doc.url + m["href"] 
      method = Meth.find_by(url) 
      
      doc.methods << method if class_method_uniq(doc, method)
    end
  end
#=========================Load Method Doc============================ 
  def self.load_method_doc(method) 
    html = Nokogiri::HTML(open(method.url))
#-------------------------------------------------------------------- 
    # documentation
    selector = "#"+method.url.gsub(/.+#method.{3}/, "")+"-method"
    container = html.search(selector)[0]
    
    doc = "" 
    container.search("p, pre, h2").each {|p| doc << p.text + "\n\n" } 
    
    # assign 
    method.doc = doc
  end 
#===================================================================# 
                                                             #HELPERS
#==================================================================== 
  def self.class_uniq(url) 
    Klass.all.none?{|klass| klass.url == url}
  end
  
  def self.method_uniq(url) 
    Meth.all.none?{|method| method.url == url}
  end
  
  def self.doc_uniq(url) 
    $DocDB.none?{|doc| doc.url == url}
  end
  
  def self.class_method_uniq(doc, method)
    doc.methods.none?{|m| m == method }
  end
#-------------------------------------------------------------------- 
  def self.prefix 
    "https://ruby-doc.org/core-2.4.3/"
  end
  
  def self.expand
  "\nTo View Full Documentation Enter 'expand'".yellow
  end
#==================================================================== 
  # def self.parse(des) 
  #   des.gsub(/[\n]/, ' ').gsub('  ',' ')
  # end
  
  # def self.methUniq(col,name) 
  #   col.none?{|meth| meth == name}
  # end
#==================================================================== 
end