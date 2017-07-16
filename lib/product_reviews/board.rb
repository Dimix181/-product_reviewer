
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

        def self.choice(obj, validator)
          puts "Type:"
          puts "'Exit' to Terminate"
          puts "'Continue' to Select another Product"
          puts "'Open' to open product page in your browser"
          puts ""
          @input = gets.downcase.strip
          puts ""
            if @input == "continue"
              validator.continue
            elsif @input == "exit"
              validator.exit
            elsif @input == "open"
              validator.open(obj)
              self.choice(obj, validator)
              else
                validator.invalid(@input)
                self.choice(obj, validator)
            end
        end

end
