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

    end

end
