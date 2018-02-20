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
    end
  end 
#===========================Load Methods============================= 
  def self.load_methods 
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
#-------------------------------------------------------------------- 
    # documentation
    container = html.search("#description")
    
    short = container.search("p")[0].text + expand
    
    doc = "" 
    container.search("p, pre, h2").each {|p| doc << p.text + "\n\n"} 
    
    # assign 
    klass.short = short
    klass.doc = doc ;binding.pry
#-------------------------------------------------------------------- 
    # methods
    methods = html.search("ul.link-list a")
    
    methods.each do |m| 
      url = klass.url + m["href"] 
      method = Meth.find_by(url)
      
      klass.methods << method if class_method_uniq(klass, method)
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
#-------------------------------------------------------------------- 
  #   # methods
  #   methods = html.search("ul.link-list a")
    
  #   methods.each do |m| 
  #     url = klass.url + m["href"] 
  #     method = Meth.find_by(url)
      
  #     klass.methods << method if class_method_uniq(klass, method)
  #   end
  # end
#==================================================================== 
                                                             #HELPERS
#==================================================================== 
  def self.prefix 
    "https://ruby-doc.org/core-2.5.0/"
  end
  
  def self.class_uniq(name) 
    Klass.all.none?{|klass| klass.name == name}
  end
  
  def self.method_uniq(name) 
    Meth.all.none?{|method| method.name == name}
  end
  
  def self.expand
  "\nTo View Full Documentation Enter 'expand'".yellow
  end
  
  def self.class_method_uniq(klass, method)
    klass.methods.none?{|m| m == method }
  end
#==================================================================== 
  def self.parse(des) 
    des.gsub(/[\n]/, ' ').gsub('  ',' ')
  end
  
  def self.methUniq(col,name) 
    col.none?{|meth| meth == name}
  end
#==================================================================== 
end