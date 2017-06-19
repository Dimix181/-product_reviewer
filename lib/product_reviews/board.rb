class ProductReviews::Board


    def display(input, list)
      system("clear") #clears the screen

        puts "___________________________________________________"
        puts"    #{list[0][:description] } "
        puts "___________________________________________________"
        puts " ****#{list[input.to_i][:title]} ****"
        puts "     #{list[input.to_i][:winner]}       #{list[input.to_i][:price]}"
        puts "___________________________________________________"
        puts "#{list[input.to_i][:summary]}"
        puts "___________________________________________________"
  
    end

end
