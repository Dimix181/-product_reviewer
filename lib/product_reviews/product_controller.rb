
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
          @list = ProductReviews::Catagory.catagory
            index = 0
          until index == @list.size-1
            puts "#{index+1} - #{@list[index][:name]}"
              index+=1
          end
      end

      def input
        @input = nil
       while @input !="exit"
        @input = gets.strip.downcase
        if @input == "exit"
          break
        elsif  @input.to_i == 0 || @input.to_i >= @list.size-1
          puts "invalid input!"
          puts "Please try again!"
          menu
        else

            url = @list[@input.to_i - 1][:url]
            @profile = ProductReviews::Catagory.profile_page(url)
          puts "************************************************************"
            puts "#{ @profile[0][:description] }"
          puts "************************************************************"
            index = 0
          until index == @profile.size-1
            puts "#{index+1} - #{@profile[index][:title]}"
              index+=1
          end
            puts "Please Choose a subcatagory !!"
              choice = gets.downcase.strip
            if choice.to_i !=0
                  puts "#{ @profile[choice.to_i][:title] }"   #title
              puts "************************************************************"
                  puts "#{ @profile[choice.to_i][:winner] }"  #winner
              puts "************************************************************"
                  puts "#{   @profile[choice.to_i][:summary] }"#summary
              puts "************************************************************"
                  puts "#{   @profile[choice.to_i][:price] }"#price
              puts "************************************************************"
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
