class Processor  
#=============================Browse Pages============================ 
  def self.page1 
    UI.browse_list($DocDB[0..499], "Page1")
  end
  
  def self.page2 
    UI.browse_list($DocDB[500..999], "Page2")
  end
  
  def self.page3 
    UI.browse_list($DocDB[1000..1499], "Page3")
  end
  
  def self.last 
    UI.browse_list($DocDB[1500..$DocDB.count], "Last")
  end
# #================================Page 2=============================== 
#   def self.page2
#     uie.sepL#
#     list(Doc.all[500..999])#
#     puts uie.sepR#
    
#     uie.browseMenu#
#     uie.browseControl("Page2", Doc.all[500..999])#
#   end
# #================================Page 3=============================== 
#   def self.page3
#     uie.sepL#
#     list(Doc.all[1000..1499])#
#     puts uie.sepR#
    
#     uie.browseMenu#
#     uie.browseControl("Page3", Doc.all[1000..1499])#
#   end
# #================================Page 4=============================== 
#   def self.page4
#     uie.sepL#
#     list(Doc.all[1500..1999])#
#     puts uie.sepR#
    
#     uie.browseMenu#
#     uie.browseControl("Page4", Doc.all[1500..1999])#
#   end
# #===============================Page Last============================= 
#   def self.last
#     uie.sepL#
#     list(Doc.all[2000..Doc.all.length])#
#     puts uie.sepR#
    
#     uie.viewMenu#
#     uie.browseControl("Last", Doc.all[2000..Doc.all.length])#
#   end 
#===============================Load Doc============================== 
  def self.load_doc(doc) 
    Scraper.load_class_doc(doc) if doc.type == "Class" || doc.type == "Module"
    Scraper.load_method_doc(doc) if doc.type == "Method"
    
    UI.display_class(doc) if doc.type == "Class" || doc.type == "Module"
    UI.display_method(doc) if doc.type == "Method"
  end
#================================SEARCH=============================== 
  def self.search(name)
    matches = $DocDB.find_all{|doc| doc.name.downcase.include?(name)}
  end
#=====================================================================
end
