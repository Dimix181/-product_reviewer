class ProductReviews::Input_handler
    def valid_catagories(input)
       if input.to_i.between?(1 , ProductReviews::Catagories.all.length)
          true
         else
           invalid(input)
       end
    end

   def valid_subcatagories(obj, input)
binding.pry
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

    def continue
      ProductReviews::ProductController.new.call
    end

    def open (obj)
      system("open #{obj[:readmore]} ")
    end

    def reverse
      ProductReviews::Catagories.sort_by_num_subcatagories
    end

    def exit
      #clears the screen
     system("clear")
      #aborts the program
      abort "Thank you for using Product Reviewer\n See you soon!!"
    end

end
