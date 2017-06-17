class ProductReviews::Board


    def display(input)
      system("clear") #clears the screen
    begin
      puts "___________________________________________________"
      puts"    #{@list[0][:description] } "
      puts "___________________________________________________"
      puts " ****#{@list[input.to_i][:title]} ****"
      puts "     #{@list[input.to_i][:winner]}       #{@list[input.to_i][:price]}"
      puts "___________________________________________________"
      puts "#{@list[input.to_i][:summary]}"
      puts "___________________________________________________"
     rescue
        puts " "
        puts "You enter an invalid option\n Please try again!!"
        puts " "
        menu
    end
      menu # back to main menu if successful
    end

end
