module DocExtras
#=====================================================================
  def paginate #page1 
    Doc.all[0..499].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
    
    puts "\nenter n for next page"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "n"
      page2
    end
  end
#=====================================================================
  def page2
    Doc.all[500..999].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
    
    puts "\nenter n for next page"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "n"
      page3
    end
  end
#=====================================================================  
  def page3
    Doc.all[1000..1499].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end
    
    puts "\nenter n for next page"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "n"
      page4
    end
  end
#=====================================================================  
  def page4
    Doc.all[1500..1999].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end
    
    puts "\nenter n for next page"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "n"
      last
    end
  end
#=====================================================================  
  def last
    Doc.all[2000..self.all.length].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end
    
    puts "\nenter m for main menu"
    input = gets.strip.to_s.downcase
    case input # SHUTTLE
    when "m"
      RubyDoc::CLI.start
    end
  end 
#=====================================================================
end
