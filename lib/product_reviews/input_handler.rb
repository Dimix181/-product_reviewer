class ProductReviews::Input_handler
    def valid_catagories(objects_created, input)
       if input.to_i.between?(1 , objects_created.size)
          true
         else
           invalid(input)
       end
    end

    def invalid(input)
      system("clear")
      puts "#{input} Is an Invalid Option"
      puts "Try Again !!"
      puts ""
      sleep(2)
     false
    end

    def continue
      ProductReviews::ProductController.new.call
    end

    def open (obj)
      system("open #{obj[:readmore]} ")
    end

    def sort
    ProductReviews::Catagories.sort_by_num_subcatagories
    end

    def exit
      #clears the screen
     system("clear")
      #aborts the program
      abort "Thank you for using Product Reviewer\n See you soon!!"
    end

end
