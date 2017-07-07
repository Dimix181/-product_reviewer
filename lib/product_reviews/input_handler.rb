class ProductReviews::Input_handler

    def valid_catagories(input)
        if  input.to_i <= 0 || input.to_i > ProductReviews::Catagories.all.length
          invalid(input)
         else
           true
       end
    end

   def valid_subcatagories(input, obj)
      if input.to_i <= 0 || input.to_i > obj.subcatagories.size
        invalid(input)
      else
        true
     end
   end

    def invalid(input)
      system("clear")
      puts "#{input} Is an Invalid Option"
      puts "Try Again !!"
      puts ""
      sleep(1)
     false
    end

    def open (url)
      system("open #{url}")
    end

    def exit
      #clears the screen
     system("clear")
      #aborts the program
      abort "Thank you for using Product Reviewer\n See you soon for good product reviews"
    end

end
