module DocExtras
#=====================================================================
  def paginate #page1 
    Doc.all[0..499].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
  end
#=====================================================================
  def page2
    Doc.all[500..999].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
  end
#=====================================================================  
  def page3
    Doc.all[1000..1499].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
  end
#=====================================================================  
  def page4
    Doc.all[1500..1999].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end
  end
#=====================================================================  
  def last
    Doc.all[2000..self.all.length].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
  end 
#=====================================================================
end
