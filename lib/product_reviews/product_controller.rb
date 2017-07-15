
#gem controller
 class ProductReviews::ProductController


    def call
      greetings
      create_main_objects
      @objects_created = ProductReviews::Catagories.all
      add_subcatagories(@objects_created)
      @validator = ProductReviews::Input_handler.new
      main_catagories_list (@objects_created)
      subcatagories_list(@objects_created, @input)
  binding.pry


#    system("clear")
#     ProductReviews::Board.display(@selected_obj, @selected_obj_description)
#     ProductReviews::Board.choice(@selected_obj, @validator)
end

    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
      puts " "
      puts "Loading  ... "

    end

    def create_main_objects
      if  ProductReviews::Catagories.all.empty?
        ProductReviews::Scraper.catagory
      end
    end

    def add_subcatagories(objects_created)
      objects_created.each do |obj|
        obj.subcatagories << ProductReviews::Scraper.profile_page(obj.url)
        obj.subcatagories.flatten!
      end
      objects_created
    end

    def main_catagories_list (objects_created)
      objects_created.each.with_index(1) do |obj, i |
          puts "#{i} #{obj.name}"
        end

          puts " "
          @input = gets.downcase.strip!
          puts ""
              if @input == "exit"
                @validator.send(@input)
            elsif  @input == "reverse"
              main_catagories_list (@validator.send(@input))

            elsif
              @validator.valid_catagories(@input)
              else
              # returns to main list
                main_catagories_list (@objects_created)
              end
    end



    def subcatagories_list(objects, input)

      @selected_obj = objects[input.to_i - 1].subcatagories
      puts "#{objects[input.to_i - 1].name} :  \n"
        @selected_obj.each.with_index do |obj, i|
          if obj[:title]
            puts "  #{i} #{obj[:title]}"
          end
        end
        puts " "
        @input_2 = gets.downcase.strip
        puts ""

      if @input == "exit"
         @validator.exit
  binding.pry
      elsif @validator.valid_subcatagories(@selected_ob, @input_2)==false
  binding.pry
        subcatagories_list(@objects_created, @input)
       else
  binding.pry
         @selected_obj = @obj.subcatagories[@input.to_i-1]
         @selected_obj_description = @obj.description
         ProductReviews::Board.display(@selected_obj, @selected_obj_description)
      end
   end



#    def add_subcatagories(array_of_obj)
#          obj = array_of_obj[@input.to_i-1]
#        if obj.subcatagories.empty?
#          array = ProductReviews::Scraper.profile_page(obj.url)
#            array.each do |element|
#              if element[:description]
#                obj.description = element[:description]
#               else
#                obj.subcatagories << element
#              end
#            end
#          end
#        subcatagories_list(@objects_created)
#      end



 end
