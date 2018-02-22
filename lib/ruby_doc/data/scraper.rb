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
    
    if html.search("#{selector}").first["class"].include?("method-alias")
      
      conn = html.search("#{selector}").first.search("a")[1]["href"] 
      rebuild = "#"+ conn.gsub(/.+#method.{3}/, "")+"-method" 
      
      container = html.search(rebuild)[0] 
    
      doc = "" 
      doc << html.search("#{selector} div.aliases").first.text + "\n\n" 
      container.search("p, pre, h2").each {|p| doc << p.text + "\n\n" }  
      
      # assign 
      method.doc = doc
    else
      container = html.search(selector)[0]
    
      doc = "" 
      container.search("p, pre, h2").each {|p| doc << p.text + "\n\n" } 
      
      # assign 
      method.doc = doc
    end 
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
  def self.changelog
    html = Nokogiri::HTML(open("https://raw.githubusercontent.com/AlphaDaniel/ruby_doc/master/changelog.md")) 
    puts "\n" + html.text
  end
  
  def self.coming_soon
    html = Nokogiri::HTML(open("https://github.com/AlphaDaniel/ruby_doc/blob/master/README.md#coming-soon")) 
    
    html.search("div#readme ul li").each do |li|
       puts ">> " + li.text
    end
  end
#==================================================================== 
end