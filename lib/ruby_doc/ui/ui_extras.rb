module UIExtras
    attr_reader :counter
#==============Loading Animation===============
  # Goes above iterator
  def loading_message
    puts " Loading Database ".colorize(color: :white, background: :cyan) + " ☠️"
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
    sleep(0.00005)
  end
#====================Data======================
  def output(doc, index)
    puts "#{index + 1}. ".yellow + doc.name.cyan
  end
  
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
	end
#==================Shuttle=====================  
# replace with second main greeting w/o sig
  def main
    RubyDoc::CLI.start
  end
#===================Input======================
  def prompt
    print " >> ".cyan
  end
  
  def alphaGets
    gets.strip.to_s.downcase
  end
#=================Separators===================
  def sepL
    puts "=".cyan*28 + "=".white*28
  end
    
  def sepR
    puts "=".white*28 + "=".cyan*28
  end
#==================Messages====================
  def mNext
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter Doc Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "To ".cyan + "Browse Next Page ".yellow + "(Enter ".cyan + "'n'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    print "\n Random Quote ".colorize(color: :white, background: :cyan)
  end
  
  def mView
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter ID Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    print "\n Random Quote ".colorize(color: :white, background: :cyan)
  end
  
  def mViewMeths(doc)
    puts "\nTo ".cyan + "View Methods ".yellow + "For".cyan + " #{doc.name}".yellow + " (Enter ".cyan + "'1'".yellow + ")".cyan
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    print "\n Random Quote ".colorize(color: :white, background: :cyan)
  end
  
  def mMain
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    print "\n Random Quote ".colorize(color: :white, background: :cyan)
  end
#==================Signature====================
  def signature
    puts "\n"+"=".white*28 + "=".cyan*28
       
puts %q(               ALPHA™
               ╦═╗╦ ╦╔╗ ╦ ╦  ╔╦╗╔═╗╔═╗╔═╗
               ╠╦╝║ ║╠╩╗╚╦╝   ║║║ ║║  ╚═╗
               ╩╚═╚═╝╚═╝ ╩   ═╩╝╚═╝╚═╝╚═╝).cyan end
#==============================================
end