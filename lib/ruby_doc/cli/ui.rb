class UI 
    attr_reader :counter #For Loading Anim
#============================================== 
                                    #IMPORTANT!
#==================Shuttle===================== 
  def main 
    RubyDoc::CLI.start
  end
#==================Control===================== 
  def self.mainControl 
    prompt
    iN = alphaGets
    iN.split.size > 1 ? mainError : RubyDoc::CLI::UI.main_Shuttle(iN)  
  end
  
  def browseControl(currentPg, docRange) 
    prompt
    iN = alphaGets
    
    case iN
    when "n"
      DataExtras.nextPage(currentPg) 
    when "m"
      main 
    when "exit!"
      exit!
    end
    # else
    !iN.to_i.between?(1,docRange.count) ? browseError(iN, currentPg, docRange) : Doc.display(docRange[iN.to_i-1])
  end
  
  def searchControl(matches) 
    matches == [] ? searchError : matches.each_with_index{|doc, index| display_list(doc, index)}
  end
  
  def choiceControl(matches) 
    prompt
    iN = alphaGets
    
    if iN == "m" 
      main
    elsif iN == "exit!"
      exit!
    elsif !iN.to_i.between?(1,matches.count)
      choiceError(matches)
    else 
      RubyDoc::CLI::UI.search_Shuttle(iN, matches)
    end   
  end
  
  def methControl 
    prompt
    iN = alphaGets
    
    case iN
    when "m" 
      main
    when "exit!"
      exit!
    else 
      methError
    end 
  end
  
  def docControl(doc) 
    prompt
    iN = alphaGets
    
    case iN
    when "1" 
      puts sepR
      doc.methods.each_with_index do |doc, index| 
        display_list(doc, index) unless doc.nil?
      end
      puts sepR
      
      viewMenu
      choiceControl(doc.methods)
      
    when "m" 
      main
    when "exit!" 
        exit!
    else 
      docError(doc)
    end 
  end
  
  def methListControl(doc) 
    prompt
    iN = alphaGets
    
    if iN == "m" 
      main
    elsif iN == "exit!" 
      exit!
    elsif !iN.to_i.between?(1,doc.methods.count) ? methListError(doc) : RubyDoc::CLI::UI.meth_Shuttle(iN, doc)
    end
  end
#===================Error====================== 
  def mainError 
    sleep(0.1)
    print redH("\n Input Must Be 1 Word or b Try Again ")
    mainControl
  end
  
  def browseError(iN, currentPg, docRange)
    if currentPg == "Last"
      choiceError(docRange)
      browseControl(currentPg, docRange)
    else
      print redH("\n Enter a number between 1 and #{docRange.count} n for next or m for main ")
      browseControl(currentPg, docRange)
    end
  end
  
  def searchError 
    puts "NO MATCH!".red
    puts "If you are searching for a ".black + "Method" + ", enter the ".black + "Class" + " or".black + "\nModule" + " it belongs to instead. This limitation will be ".black + "\naddressed in future update".black
    puts "=".black*56
    
    puts "Example: ".red + "Find".black + " 'reverse'" + " by searching".black + " 'String'"
    mess = "'Reverse' method will be included in the doc's Methods:# (Additionally feel free to browse all docs)".black
    puts wrapped(mess, 70).black
    
    print redH("\n Try A New Word or 'b' To Browse ")
    mainControl
  end
  
  def choiceError(matches) 
    print redH("\n Enter a number between 1 and #{matches.count} or m for main ")
    choiceControl(matches)
  end
  
  def docError(doc)
    print redH("\n Please enter '1' or 'm' ")
    docControl(doc)
  end
  
  def methError
    print redH("\n Please enter 'm' to return to main menu ")
    methControl
  end
  
  def methListError(doc) 
    print redH("\n Enter a number between 1 and #{doc.methods.count} or m for main ")
    methListControl(doc)
  end
#===================Menus====================== 
  def self.mainMenu 
    puts sepR#
    puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
    puts "try to find a match in my database for you.".cyan
    sepL#
    puts "\You can also type".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
    print cyanH("\n If You're Searching... Single Word Inputs Only Please ")
  end
  
  def browseMenu 
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter Doc Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "To ".cyan + "Browse Next Page ".yellow + "(Enter ".cyan + "'n'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
  
  def viewMenu 
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter ID Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end

  def docMenu(doc) 
    puts "To ".cyan + "View Methods ".yellow + "For".cyan + " #{doc.name}".yellow + " (Enter ".cyan + "'1'".yellow + ")".cyan
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
  
  def methMenu 
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
#===================Input====================== 
  def self.prompt 
    print " >> ".cyan
  end
  
  def self.alphaGets 
    gets.strip.to_s.downcase
  end
#==================Display===================== 
  def display_list(doc, index)
    li = ["#{index + 1}.".yellow, doc.name.light_cyan] if doc.type == "Class"
    li = ["#{index + 1}.".yellow, doc.name.cyan] if doc.type == "Method"
    
    puts li.join(" ")
  end
  
  def display_class(doc) 
    puts "TITLE: ".cyan + doc.name.upcase 
    puts "TYPE: ".cyan + doc.type.upcase
    puts "\NDESCRIPTION:".cyan 
    puts doc.doc
    puts "Methods: ".cyan + "#{doc.methods.count}".yellow
    puts "Source: #{doc.url}".red 
    puts sepR
    
    #-----------future fix------------#
    # description = doc.doc
    # puts uie.wrapped(description, 55)
    #-----------future fix------------#
    
    docMenu(doc)
    docControl(doc)
  end
  
  def display_method(doc) 
    puts "Title: ".cyan + doc.name.upcase 
    puts "Type: ".cyan + doc.type.upcase
    puts "\nDescription:".cyan 
    puts doc.doc
    puts "\nMethods: ".cyan + "#{doc.methods.count}".yellow
    puts "Source: #{doc.url}".red 
    puts sepR
    
    #-----------future fix------------#
    # description = doc.doc
    # puts uie.wrapped(description, 55)
    #-----------future fix------------#
    
    methMenu
    methControl
    
    RubyDoc::CLI.start if iN == "m"
  end
#============================================== 
                                        #CANDY
#===============Quote Scraper================== 
  def randQ
    html = Nokogiri::HTML(open("https://fortrabbit.github.io/quotes/"))
    container = html.search(".row.gutter-l.wrap")
    
    quotes = container.search("p").map {|quote| quote.text.gsub(/[\n]\s+/, "")}
    quote = " "+ quotes[rand(0..180)]+ " "
    wrapped(quote, 55).black
  end
#=============Loading Animation================ 
  # Goes above iterator
  def self.loading_message 
    puts cyanH(" Loading Database ") + " ☠️"
  end
  # Goes inside iterator - last line
  def self.loading_animation 
    loading = ""
    print loading << ". ".cyan if 
    @counter == 100 || @counter == 200 || @counter == 300 || @counter == 400 || 
    @counter == 500 || @counter == 600 || @counter == 700 || @counter == 800 || 
    @counter == 900 || @counter == 1000 || @counter == 1100 || @counter == 1200 || 
    @counter == 1300 || @counter == 1400 || @counter == 1500 || @counter == 1600 || 
    @counter == 1700 || @counter == 1800 || @counter == 1900 || @counter == 2000 || 
    @counter == 2100 || @counter == 2200 || @counter == 2300 || @counter == 2320 || 
    @counter == 2340 || @counter == 2360 || @counter == 2380 || @counter == 2400
  end
#=================Separators=================== 
  def self.sepL 
    puts "=".cyan*28 + "=".white*28
  end
    
  def self.sepR 
    "=".white*28 + "=".cyan*28
  end
#==================Strings===================== 
  def self.cyanH(str)
    str.colorize(color: :white, background: :cyan)
  end#cyan highlight
  
  def self.redH(str)
    str.colorize(color: :white, background: :red)
  end#red highlight
#----------------Future Fix-------------------- 
  #   def wrapped(s, width=78) 
  # 	  lines = []
  # 	  line = ""
  	 
  # 	  s.split(/\s+/).each do |word|
  # 	    if line.size + word.size >= width
  # 	      lines << line
  # 	      line = word
  # 	    elsif line.empty?
  # 	     line = word
  # 	    else
  # 	     line << " " << word
  # 	   end
  # 	   end
  # 	   lines << line if line
  # 	  return lines.join "\n"
  # 	end#wrap string
#=================Signature==================== 
  def self.signature 
    puts "\n"+"=".white*28 + "=".cyan*28 
puts %q(               ALPHA™ 
               ╦═╗╦ ╦╔╗ ╦ ╦  ╔╦╗╔═╗╔═╗╔═╗
               ╠╦╝║ ║╠╩╗╚╦╝   ║║║ ║║  ╚═╗
               ╩╚═╚═╝╚═╝ ╩   ═╩╝╚═╝╚═╝╚═╝).cyan end
#==============================================
end