
#gem controller
 class ProductReviews::ProductController
    def call
      greetings
      menu
      input
      goodbye
    end


    def greetings
      puts "****** Welcome to The Product Reviewer ******"
      puts "*******************************************"
      puts "Thanks to thewirecutter.com for making this possible"
      puts "*******************************************"
    end

      def menu
        puts "Choose a Catagory to Get Started"
        puts "Type 'exit' at anytime to exit!"
        puts "1 - Headphones"
        puts "2 - Computers"
        puts "3 - Headphones"
        puts "4 - HomeSweet Home"
        puts "5 - Electronic"
      end

      def input
        input = nil
       while input !="exit"
        input = gets.strip.downcase
        if input == "exit"
          break
        elsif input.to_i == 0 || input.to_i > 5
          puts "invalid input!"
          puts "Please try again!"
          menu
        else
          case input.to_i
          when input = 1
              display
              puts ""
              menu
            when input = 2
              display
              puts ""
              menu
            when input = 3
              display
              puts ""
              menu
            when input = 4
              display
              puts ""
              menu
            when input = 5
              display
              puts ""
              menu
          end
        end
      end
    end

    def display
      puts "Catagory"
      puts"   Catagory Description ......  "
      puts "___________________________________________________"
      puts " In ear "
      puts " Over the ear "
      puts " wired headphone"
    end

    def goodbye
      puts "Thank you for using the Product Reviewer"
      puts "See you again for the best review in the Planet"
    end



 end
