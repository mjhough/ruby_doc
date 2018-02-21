module DataExtras # = foreign method
#===================================================================== 
                                                              #HELPERS
#===================================================================== 
  #@all set/get maker for Doc & Meth 
  def self.extended(base) 
    base.class_variable_set(:@@all, [])
  end
  
  def all 
    self.class_variable_get(:@@all)
  end
  
  #UIExtras Shuttles 
  def self.uie 
    RubyDoc::CLI::UI
  end
  
  def uie 
    RubyDoc::CLI::UI
  end
#===================================================================== 
                                                            #PAGINATOR
#===================================================================== 
  #PageLister
  def list(page) 
    page.each_with_index{|doc, index| uie.outputD(doc, index)}
  end
  
  def self.list(page) 
    page.each_with_index{|doc, index| uie.outputD(doc, index)}
  end
  
  #PageShuttle
  def self.nextPage(currentPg) 
    case currentPg
    when "Page1" 
      page2
    when "Page2" 
      page3
    when "Page3" 
      page4
    when "Page4" 
      last
    end
  end
#==============================PaginateAll============================ 
  def paginateALL 
    uie.sepL#
    list(Doc.all[0..499])#
    puts uie.sepR#
    
    uie.browseMenu#
    uie.browseControl("Page1", Doc.all[0..499])#
  end
#================================Page 2=============================== 
  def self.page2
    uie.sepL#
    list(Doc.all[500..999])#
    puts uie.sepR#
    
    uie.browseMenu#
    uie.browseControl("Page2", Doc.all[500..999])#
  end
#================================Page 3=============================== 
  def self.page3
    uie.sepL#
    list(Doc.all[1000..1499])#
    puts uie.sepR#
    
    uie.browseMenu#
    uie.browseControl("Page3", Doc.all[1000..1499])#
  end
#================================Page 4=============================== 
  def self.page4
    uie.sepL#
    list(Doc.all[1500..1999])#
    puts uie.sepR#
    
    uie.browseMenu#
    uie.browseControl("Page4", Doc.all[1500..1999])#
  end
#===============================Page Last============================= 
  def self.last
    uie.sepL#
    list(Doc.all[2000..Doc.all.length])#
    puts uie.sepR#
    
    uie.viewMenu#
    uie.browseControl("Last", Doc.all[2000..Doc.all.length])#
  end 
#==============================Display Doc============================ 
  def display(doc)
    Scraper.loadDocPage(doc)#Load
    
    uie.sepL#
    puts "Title: ".cyan + doc.name.upcase
    puts "Type: ".cyan + doc.type.upcase
    puts "\nDescription:".cyan
    description = doc.description
    puts uie.wrapped(description, 55)
    puts "\nMethods: ".cyan + "#{doc.methods.count}".yellow
    puts "Source: #{doc.url}".red 
    puts uie.sepR#
    
    uie.docMenu(doc)#
    uie.docControl(doc)#
  end
#==============================List Meths============================= 
  def listMeths(doc)
    uie.sepL#
    doc.methods.each_with_index do |meth, index|  
      puts "#{index + 1}. ".yellow + meth.cyan
    end 
    puts uie.sepR#
    
    uie.viewMenu#
    uie.methListControl(doc)#
  end
#=============================Display Meth============================ 
  def displayMeth(byName)
    meth = Meth.find(byName)
    Scraper.loadMethPage(meth)#Load
    
    uie.sepL#
    puts "Title: ".cyan + meth.name.upcase
    puts "Type: ".cyan + meth.type.upcase
    puts "\nDescription:".cyan
    description = meth.description
    puts uie.wrapped(description, 55)
    puts "\nSource: #{meth.url}".red
    puts uie.sepR#
    
    uie.methMenu#
    uie.methControl#
    
    RubyDoc::CLI.start if iN == "m"
  end
#=============================SUPER SEARCH============================ 
  def super_search(name)
    uie.sepL#
    matches = $DocDB.find_all{|doc| doc.name.downcase.include?(name)}
    
    uie.searchControl(matches)#
    puts uie.sepR#
    
    uie.viewMenu#
    uie.choiceControl(matches)#
  end
#=====================================================================
end
