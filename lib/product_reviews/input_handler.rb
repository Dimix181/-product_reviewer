class ProductReviews::Input_handler

  def self.user_input(input, url=nil )
    
  binding.pry
    if input == "exit"
       system("clear") #clears the screen
          abort "Thank you for using Product Reviewer\n See you soon" #aborts the program
    elsif input == "open"
        system("open #{url}")

    elsif input.to_i <= 0
      puts "You entered an invalid option"

    elsif #compare length of calling method to input if greater
      puts "You entered and option that doesn't exist"
      puts "Try Again !!"
      #restart method called.
    else
      input
    end

  end

end
