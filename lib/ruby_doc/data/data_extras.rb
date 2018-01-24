module DataExtras
#====================
#UIExtras Shuttle 
  def self.uie
    RubyDoc::CLI::UI
  end
#===============================Paginator============================= 
  def paginateALL
    uie.sepL#
    Doc.all[0..499].each_with_index do |doc, index|
      uie.output(doc, index)#
    end
    puts uie.sepR#
    
    uie.mNext#
    uie.prompt#
    iN = uie.alphaGets#
      
    case iN
    when "n"
      page2
    when "m"
      uie.main  
    else
      # DRY 
      Doc.display(Doc.all[iN.to_i-1])
    end
  end
#===================================================================== 
  def page2 
    uie.sepL#
    Doc.all[500..999].each_with_index do |doc, index|
      uie.output(doc, index)#
    end
    puts uie.sepR#
    
    uie.mNext#
    uie.prompt#
    iN = uie.alphaGets#
      
    case iN
    when "n"
      page3
    end
  end
#===================================================================== 
  def page3
    uie.sepL#
    Doc.all[1000..1499].each_with_index do |doc, index|
      uie.output(doc, index)#
    end
    puts uie.sepR#
    
    uie.mNext#
    uie.prompt#
    iN = uie.alphaGets#
      
    case iN
    when "n"
      page4
    end
  end
#===================================================================== 
  def page4
    uie.sepL#
    Doc.all[1500..1999].each_with_index do |doc, index|
      uie.output(doc, index)#
    end
    puts uie.sepR#
    
    uie.mNext#
    uie.prompt#
    iN = uie.alphaGets#
      
    case iN
    when "n"
      last
    end
  end
#===================================================================== 
  def last
    uie.sepL#
    Doc.all[2000..self.all.length].each_with_index do |doc, index|
      uie.output(doc, index)#
    end
    puts uie.sepR#
    
    uie.viewMenu#
    uie.prompt#
    iN = uie.alphaGets#
      
    case iN
    when "m"
      RubyDoc::CLI.start
    end
  end 
#==============================Display Doc============================ 
  def display(doc)
    #UIExtras Shuttle 
    def uie 
      RubyDoc::CLI::UI
    end
    Scraper.load_doc_page(doc)#Load
    
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
  def self.displayMeth(byName)
    meth = Meth.find(byName)
    Scraper.get_methPage(meth)#Load
    
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
  def self.superSEARCH(name)
    uie.sepL#
    matches = Doc.all.find_all{|doc| doc.name.downcase.include?(name)}
    
    uie.searchControl(matches)#
    puts uie.sepR#
    
    uie.viewMenu#
    uie.choiceControl(matches)#
  end
#==============================SUPER SEARCH===========================
=begin 
  # NOTES: For now this only searches all doc objects (iterating Doc.all)
  I would like to improve this to also search through all Meth objects.
  The issue here explained below...
  
  Population of all methods can only be done through scraping each individual
  doc page for all its meth urls. In this site, methods are spread out 
  and not available in their entirety, in a singular container or list. 
  
  Roadmap: In this CLI I pre-load all docs through Scraper.loadDOCS in 
  environment.rb before my exec is ran. When user first lands at UI.greeting
  all docs (objects) are already loaded.
  
  To initiate the scrape I need to retrieve a method for instantiation, 
  I pass in a Doc class object's url attribute. Since, as previously stated,
  ALL methods do not live in one place... The logical solution would be to 
  iterate through Doc.all, pass (obj).url to block and call Scraper.load_doc_page()
  passing in every iteration. This would essentially instantiate meth objects 
  for all methods included on all doc pages.
  
  2 big issues arise with this fact. The first and most important URI will not 
  let me iterate and open each page (redirection open loop error). 2nd, 
  even if we did we would be opening, scraping, and iterating through 
  2403 different site pages. As you can imagine this would not be practical
  
  Plan for improvement:
  I will be researching a way to patch this error so as to allow the iteration
  and if successful decide on implementation based on run time.
  
  If unsuccessful I will be looking into changing my scrapers to point to 
  http://ruby-doc.org/ which was my initial plan with this CLI. As this is 
  my very first CLI the layout of this site was a bit intimidating at first glance
  as far as scraping successfully. At the completetion of this CLI I am now 
  a lot more confident in my abilities so this will most likely be the way 
  I go. 
=end
#=====================================================================
end
