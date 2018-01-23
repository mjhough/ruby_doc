module UIExtras
#====================Data======================
  def output(doc, index)
    puts "#{index + 1}. ".yellow + doc.name.cyan
  end
#==================Shuttle=====================  
# replace with second main greeting w/o sig
  def main
    sepR
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
    puts "To ".cyan + "View An Item ".yellow + "From This List (Enter Doc Number eg.".cyan + "'1'".yellow + ")".cyan
    puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    print "\n Random Quote ".colorize(color: :white, background: :cyan)
  end
#==============================================
end