module UIExtras 
    attr_reader :counter #For Loading Anim
#============================================== 
                                    #IMPORTANT!
#==================Shuttle===================== 
  def main 
    RubyDoc::CLI.start
  end
#==================Control===================== 
  def mainControl 
    prompt
    iN = alphaGets
    
    if iN.split.size > 1
      mainError
    else
      RubyDoc::CLI::UI.main_Shuttle(iN)
    end   
  end
  
  def searchControl(matches) 
    case matches
    when [] 
      searchError
    else 
      matches.each_with_index{|doc, index| output(doc, index)}
    end  
  end
  
  def choiceControl(matches) 
    prompt
    iN = alphaGets
    
    if iN == "m" 
      main
    elsif !iN.to_i.between?(1,matches.count)
      choiceError(matches)
    else 
      RubyDoc::CLI::UI.search_Shuttle(iN, matches)
    end   
  end
  
  def docControl(doc) 
    prompt
    iN = alphaGets
    
    case iN
    when "1" 
      Doc.listMeths(doc)
    when "m" 
      main
    else 
      docError(doc)
    end 
  end
  
  def methControl 
    prompt
    iN = alphaGets
    
    case iN
    when "m" 
      main
    else 
      methError
    end 
  end
#===================Error====================== 
  def mainError 
    sleep(0.1)
    print redH("\n Input Must Be 1 Word or b Try Again ")
    mainControl
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
#===================Menus====================== 
  def mainMenu 
    puts sepR#
    puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
    puts "try to find a match in my database for you.".cyan
    sepL#
    puts "\You can also type".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
    print cyanH("\n If You're Searching... Single Word Inputs Only Please ")
  end
  
  def mNext 
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
  def prompt 
    print " >> ".cyan
  end
  
  def alphaGets 
    gets.strip.to_s.downcase
  end
#==================Display===================== 
  def output(doc, index)
    puts "#{index + 1}. ".yellow + doc.name.cyan
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
  def loading_message 
    puts cyanH(" Loading Database ") + " ☠️"
  end
  # Goes inside iterator - last line
  def loading_animation 
    loading = ""
    print loading << ". ".cyan if 
    counter == 100 || counter == 200 || counter == 300 || counter == 400 || 
    counter == 500 || counter == 600 || counter == 700 || counter == 800 || 
    counter == 900 || counter == 1000 || counter == 1100 || counter == 1200 || 
    counter == 1300 || counter == 1400 || counter == 1500 || counter == 1600 || 
    counter == 1700 || counter == 1800 || counter == 1900 || counter == 2000 || 
    counter == 2100 || counter == 2200 || counter == 2300 || counter == 2320 || 
    counter == 2340 || counter == 2360 || counter == 2380 || counter == 2400
    # sleep(0.00001)
  end
#=================Separators=================== 
  def sepL 
    puts "=".cyan*28 + "=".white*28
  end
    
  def sepR 
    "=".white*28 + "=".cyan*28
  end
#==================Strings===================== 
  def wrapped(s, width=78) 
	  lines = []
	  line = ""
	 
	  s.split(/\s+/).each do |word|
	    if line.size + word.size >= width
	      lines << line
	      line = word
	    elsif line.empty?
	     line = word
	    else
	     line << " " << word
	   end
	   end
	   lines << line if line
	  return lines.join "\n"
	end#wrap string

  def cyanH(str)
    str.colorize(color: :white, background: :cyan)
  end#cyan highlight
  
  def redH(str)
    str.colorize(color: :white, background: :red)
  end#red highlight
#=================Signature==================== 
  def signature 
    puts "\n"+"=".white*28 + "=".cyan*28 
puts %q(               ALPHA™ 
               ╦═╗╦ ╦╔╗ ╦ ╦  ╔╦╗╔═╗╔═╗╔═╗
               ╠╦╝║ ║╠╩╗╚╦╝   ║║║ ║║  ╚═╗
               ╩╚═╚═╝╚═╝ ╩   ═╩╝╚═╝╚═╝╚═╝).cyan end
#==============================================
end