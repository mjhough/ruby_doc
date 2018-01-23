module DataExtras
#====================
#UIExtras Shuttle
  def uiextras
    RubyDoc::CLI::UI
  end
#Inherited Methods: sepL, sepR, prompt, alphaGets, output, mNext, mView
#===============================PAGINATOR============================== 
  def paginateALL
    uiextras.sepL#
    Doc.all[0..499].each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    uiextras.sepR#
    
    uiextras.mNext#
    uiextras.prompt#
    iN = uiextras.alphaGets#
      
    case iN
    when "n"
      page2
    when "m"
      uiextras.main  
    else
      # DRY 
      Doc.display(Doc.all[iN.to_i-1])
    end
  end
#=====================================================================
  def page2 
    uiextras.sepL#
    Doc.all[500..999].each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    uiextras.sepR#
    
    uiextras.mNext#
    uiextras.prompt#
    iN = uiextras.alphaGets#
      
    case iN
    when "n"
      page3
    end
  end
#======================================================================  
  def page3
    uiextras.sepL#
    Doc.all[1000..1499].each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    uiextras.sepR#
    
    uiextras.mNext#
    uiextras.prompt#
    iN = uiextras.alphaGets#
      
    case iN
    when "n"
      page4
    end
  end
#======================================================================  
  def page4
    uiextras.sepL#
    Doc.all[1500..1999].each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    uiextras.sepR#
    
    uiextras.mNext#
    uiextras.prompt#
    iN = uiextras.alphaGets#
      
    case iN
    when "n"
      last
    end
  end
#======================================================================  
  def last
    uiextras.sepL#
    Doc.all[2000..self.all.length].each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    uiextras.sepR#
    
    uiextras.mView#
    uiextras.prompt#
    iN = uiextras.alphaGets#
      
    case iN
    when "m"
      RubyDoc::CLI.start
    end
  end 
#=====================================================================
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
#==============================SUPER SEARCH===========================
  def self.superSEARCH(name)
    matches = Doc.all.find_all{|i| i.name.downcase.include?(name)}
    #check if somewhere in here causes dup output list
    matches.each_with_index do |doc, index|
      uiextras.output(doc, index)#
    end
    
    puts "enter doc id to view"
    input = gets.strip.to_s.downcase
    
    case input #Shuttle
    when "m"
      main_menu#
    else
      Doc.display(matches[input.to_i-1])#
    end
  end
#==============================SUPER SEARCH===========================
#=====================================================================
end
