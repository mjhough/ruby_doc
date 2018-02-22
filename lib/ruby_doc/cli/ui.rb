class UI 
#=============================================# 
                                    #IMPORTANT
#=================Properties=================== 
  attr_reader :counter #For Loading Anim
#=================Shuttles===================== 
  # def self.main_shuttle(input) 
  #   case input 
  #   when "b" 
  #     DataProcessor.paginate 
  #   when "exit!"
  #     exit!
  #   else
  #     DataProcessor.super_search(input)
  #   end
  # end
  
  # def self.main 
  #   RubyDoc::CLI.start
  # end
    
  # def self.search_shuttle(input, matches) 
  #   input == "m" ? greeting : DataProcessor.doc_data(matches[input.to_i-1])
  # end
  
  # def self.meth_shuttle(input, doc) 
  #   displayMeth(doc.methods[input.to_i-1])
  # end  
#==================Control===================== 
  def self.main_control 
    prompt
    input = my_gets
    
    if input.split.size > 1 
      main_error
    elsif input == "b"
      DataProcessor.paginate 
    elsif input == "exit!"
      exit!
    else
      Processor.search(input)
    end
    
  end
  
  def self.search_control(matches) 
    
    
  end
  
  # def self.browse_control(currentPg, docRange) 
  #   prompt
  #   input = my_gets
    
  #   case input
  #   when "n"
  #     DataExtras.nextPage(currentPg) 
  #   when "m"
  #     main 
  #   when "exit!"
  #     exit!
  #   end
  #   # else
  #   !input.to_i.between?(1,docRange.count) ? browse_error(input, currentPg, docRange) : Doc.display(docRange[input.to_i-1])
  # end
  
  # def self.choice_control(matches) 
  #   prompt
  #   input = my_gets
    
  #   if input == "m" 
  #     main
  #   elsif input == "exit!"
  #     exit!
  #   elsif !input.to_i.between?(1,matches.count)
  #     choice_error(matches)
  #   else 
  #     search_shuttle(input, matches)
  #   end   
  # end
  
  # def self.meth_control 
  #   prompt
  #   input = my_gets
    
  #   case input
  #   when "m" 
  #     main
  #   when "exit!"
  #     exit!
  #   else 
  #     methError
  #   end 
  # end
  
  # def self.doc_control(doc) 
  #   prompt
  #   input = my_gets
    
  #   case input
  #   when "1" 
  #     puts sepR
  #     doc.methods.each_with_index do |doc, index| 
  #       display_list(doc, index) unless doc.nil?
  #     end
  #     puts sepR
      
  #     view_menu
  #     choice_control(doc.methods)
      
  #   when "m" 
  #     main
  #   when "exit!" 
  #       exit!
  #   else 
  #     doc_error(doc)
  #   end 
  # end
  
  # def self.list_control(doc) 
  #   prompt
  #   input = my_gets
    
  #   if input == "m" 
  #     main
  #   elsif input == "exit!" 
  #     exit!
  #   elsif !input.to_i.between?(1,doc.methods.count) ? list_error(doc) : RubyDoc::CLI::UI.meth_shuttle(input, doc)
  #   end
  # end
#==================Display===================== 
  def self.display_list(matches) 
    matches.each_with_index do |doc, index| 
      
      if doc.type == "Class" || doc.type == "Module"
        li = ["#{index + 1}.".yellow, doc.name.light_cyan]
      else
        li = ["#{index + 1}.".yellow, doc.name.cyan]
      end
      
      puts li.join(" ")
    end
  end
  
  # def self.display_class(doc) 
  #   puts "TITLE: ".cyan + doc.name.upcase 
  #   puts "TYPE: ".cyan + doc.type.upcase
  #   puts "\nDESCRIPTION:".cyan 
  #   puts doc.doc
  #   puts "Methods: ".cyan + "#{doc.methods.count}".yellow
  #   puts "Source: #{doc.url}".red 
  #   puts sepR
    
  #   doc_menu(doc)
  #   doc_control(doc)
  # end
  
  # def self.display_method(doc) 
  #   puts "Title: ".cyan + doc.name.upcase 
  #   puts "Type: ".cyan + doc.type.upcase
  #   puts "\nDescription:".cyan 
  #   puts doc.doc
  #   puts "Source: #{doc.url}".red 
  #   puts sepR
    
  #   #-----------future fix------------#
  #   # description = doc.doc
  #   # puts uie.wrapped(description, 55)
  #   #-----------future fix------------#
    
  #   meth_menu
  #   meth_control
    
  #   RubyDoc::CLI.start if input == "m"
  # end
#===================Error====================== 
  def self.main_error 
    sleep(0.1)
    print redH("\n Input Must Be 1 Word or b Try Again ")
    main_control
  end
  
  def self.browse_error(input, currentPg, docRange) 
    if currentPg == "Last"
      choice_error(docRange)
      browse_control(currentPg, docRange)
    else
      print redH("\n Enter a number between 1 and #{docRange.count} n for next or m for main ")
      browse_control(currentPg, docRange)
    end
  end
  
  def self.search_error 
    puts "NO CIGAR!".red
    puts "How about trying a Ruby ".black + "Method" + ", ".black + "Class" + " or ".black + "Module" + " name.".black
    puts "=".black*56
    
    print redH("\n Try A New Word or 'b' To Browse ")
    main_control
  end
  
  # def self.choice_error(matches) 
  #   print redH("\n Enter a number between 1 and #{matches.count} or m for main ")
  #   choice_control(matches)
  # end
  
  def self.doc_error(doc) 
    print redH("\n Please enter '1' or 'm' ")
    doc_control(doc)
  end
  
  def self.meth_error 
    print redH("\n Please enter 'm' to return to main menu ")
    meth_control
  end
  
  def self.list_error(colection) 
    print redH("\n Enter a number between 1 and #{collection.count} or m for main ")
    list_control(doc)
  end
#===================Menus====================== 
  def self.main_menu 
    puts sepR#
    puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
    puts "try to find a match in my database for you.".cyan
    sepL#
    puts "\You can also type".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
    print cyanH("\n If You're Searching... Single Word Inputs Only Please ")
  end
  
  def self.browse_menu 
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter Doc Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "To ".cyan + "Browse Next Page ".yellow + "(Enter ".cyan + "'n'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
  
  def self.view_menu 
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter ID Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end

  def self.doc_menu(doc) 
    puts "To ".cyan + "View Methods ".yellow + "For".cyan + " #{doc.name}".yellow + " (Enter ".cyan + "'1'".yellow + ")".cyan
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
  
  def self.meth_menu 
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
    print randQ
  end
#===================Input====================== 
  def self.prompt 
    print " >> ".cyan
  end
  
  def self.my_gets 
    gets.strip.to_s.downcase
  end
#============================================== 
                                        #CANDY
#===============Quote Scraper================== 
  def self.randQ
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

  def self.wrapped(s, width=78) 
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
	end #wrap string
#=================Signature==================== 
  def self.signature 
    puts "\n"+"=".white*28 + "=".cyan*28 
puts %q(               ALPHA™ 
               ╦═╗╦ ╦╔╗ ╦ ╦  ╔╦╗╔═╗╔═╗╔═╗
               ╠╦╝║ ║╠╩╗╚╦╝   ║║║ ║║  ╚═╗
               ╩╚═╚═╝╚═╝ ╩   ═╩╝╚═╝╚═╝╚═╝).cyan end
#==============================================
end