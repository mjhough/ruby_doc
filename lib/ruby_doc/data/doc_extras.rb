module DocExtras
#==============================================
  def paginate
    Doc.all[0..499].each_with_index do |doc, index|
      puts "#{index + 1}. " + doc.title
    end 
    binding.pry
  end
#==============================================
end