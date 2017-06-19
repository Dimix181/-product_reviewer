
#gem controller
 class ProductReviews::ProductController
    def call
      greetings
      menu
    end



    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
    end

      def menu
        @list = ProductReviews::Catagory.catagory
        @list.each.with_index(1){|obj, i| puts "#{i} - #{obj[:name]}" }
          # list catagories
          main_catagories
      end

      def main_catagories
        puts ""
          puts "Please Choose a Catagory to Get Started\n or Type 'exit' at anytime to quit!"

        @input = gets.strip.downcase
            system("clear") #clears the screen
          if @input == "exit"
             exit
           elsif @input.to_i > @list.size || @input.to_i < 1
             puts ""
                puts "Invalid Input, Please Try Again!!"
                puts ""
                  menu
            else
              subcatagories(@input)
          end
       end

      def subcatagories(input)
          system( "clear" ) #clears the screen

          url = @list[@input.to_i - 1][:url]
        @list = ProductReviews::Catagory.profile_page(url)
        @list.each_with_index do |obj, i|

           if obj[:title] !=nil
             # list subcatagories
             puts "#{i} - #{obj[:title]}"
           end
         end

         puts " Please Choose a Subcatagory !!\n"
         @input = gets.strip.downcase
         system("clear") #clears the screen
         if @input == "exit"
           exit
         elsif @input.to_i > @list.size-1 || @input.to_i <=0
             puts "Invalid Input, Please Try Again!!"
             menu
         else
           board = ProductReviews::Board.new
           board.display(@input, @list)
          menu #returns back to the main menu
         end

       end

    def exit #aborts the program
      system("clear") #clears the screen
        abort "Thank you for using Product Reviewer\n See you soon"
    end


 end
