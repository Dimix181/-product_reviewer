class ProductReviews::Input_handler

    def valid?(input)
binding.pry
      if  input.to_i <= 0 || input.to_i > ProductReviews::Catagories.all.length
        #clears the screen
       system("clear")
        puts ""
        puts "An Invalid Option was entered!"
        puts "Please Try Again!"
        puts ""
        sleep(1)
      false
    elsif input.to_i <= 0 || input.to_i > 

       else
      true
     end
    end

    def restart

    end

    def open (url)
      system("open #{url}")
    end

    def exit
      #clears the screen
     system("clear")
      #aborts the program
      abort "Thank you for using Product Reviewer\n See you soon"
    end

end
