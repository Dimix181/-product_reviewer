
#gem controller
 class ProductReviews::ProductController
    def call
      greetings
      menu
      input
      goodbye
    end


    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
    end

      def menu
        @list = ProductReviews::Catagory.catagory
        @list.each.with_index(1){|obj, i| puts "#{i} - #{obj[:name]}" }
        # list catagories
      end

      def input
        @input = nil
       while @input !="exit"
         puts "Choose a Catagory to Get Started\nType 'exit' at anytime to exit!"

        @input = gets.strip.downcase

          if @input == "exit"
              break
            elsif @input.to_i == 0 || @input.to_i >= @list.size+1
              puts "invalid input! \n Please try again!"
                menu # returns back to main catagories
             else
                system( "clear" ) #clears the screen the program doesn't feel so clutter
                  url = @list[@input.to_i - 1][:url]
                  @profile = ProductReviews::Catagory.profile_page(url)
                  @profile.each.with_index(1) do |obj, i|
                    if obj[:title] != nil
                      puts "#{i-1} - #{obj[:title]}"
                    end
                end
                  puts "Please Choose a Subcatagory !!"
                  display(@input = gets.strip.downcase)
              end

            end
          end

    def display(input)
      system("clear")
      puts "___________________________________________________"
      puts"   #{@profile[0][:description] }"
      puts "___________________________________________________"
      puts " ****#{@profile[input.to_i][:title]}****"
      puts "     #{@profile[input.to_i][:winner]}       #{@profile[input.to_i][:price]}"
      puts "___________________________________________________"
      puts "#{@profile[input.to_i][:summary].gsub('Read More >','').strip}"
      puts "___________________________________________________"
        menu
    end

    def goodbye
      system("clear")
      puts "Thank you for using the Product Reviewer"
      puts "See you soon for some more awesome reviews"
    end

 end
