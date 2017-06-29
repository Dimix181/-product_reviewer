
class ProductReviews::Board


    def self.display(obj, description)
      system("clear") #clears the screen


        puts "___________________________________________________"
        puts" #{description}"
        puts "___________________________________________________"
        puts "#{obj[:readmore]} "
        puts "___________________________________________________"
        puts " ****#{obj[:title]} ****"
        puts "     #{obj[:winner]}       #{obj[:price]}"
        puts "___________________________________________________"
        puts "#{obj[:summary]}"
        puts "___________________________________________________"
        puts "___________________________________________________"
      end

        def self.choice(obj)
          puts "Type:"
          puts "'Exit' to Terminate"
          puts "'Continue' to Select another Product"
          puts "'Open' to open product page in your browser"
          puts ""
          @input = gets.downcase.strip
          puts ""
            if @input == "continue"
              true
            elsif @input == "exit"
              "exit"
            elsif @input == "open"
                system("open #{obj[:readmore]} ")
            end
        end

end
