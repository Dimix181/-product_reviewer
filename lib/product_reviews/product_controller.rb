
#gem controller
 class ProductReviews::ProductController


    def call
      greetings
      create_main_objects
      @objects_created = ProductReviews::Catagories.all
      add_subcatagories(@objects_created)
      binding.pry
      @validator = ProductReviews::Input_handler.new
      main_catagories_list (@objects_created)
    system("clear")
     ProductReviews::Board.display(@selected_obj, @selected_obj_description)
     ProductReviews::Board.choice(@selected_obj, @validator)
end

    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
      puts " "
    end

    def create_main_objects
      if  ProductReviews::Catagories.all.empty?
        ProductReviews::Scraper.catagory
      end
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
        elsif
          @validator.valid_catagories(@input) ==false
          #returns to main list
            main_catagories_list (@objects_created)
          else
          #moves forward to subcatagories
            add_subcatagories(@objects_created)
          end
    end

    def add_subcatagories(objects_created)
      objects_created.each do |obj|
        obj.subcatagories << ProductReviews::Scraper.profile_page(obj.url)
        obj.subcatagories.flatten!
      end
      objects_created
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

    def subcatagories_list(array_of_obj)

      @obj = array_of_obj[@input.to_i-1]

      @obj.subcatagories.each.with_index(1) do |obj, i|
          if obj[:title]
            puts "#{i} #{obj[:title]}"
          end
        end
        puts " "
        @input = gets.downcase.strip
        puts ""

      if @input == "exit"
         @validator.exit
       elsif @validator.valid_subcatagories(@input, @obj)==false

         subcatagories_list(@objects_created)
       else
         @selected_obj = @obj.subcatagories[@input.to_i-1]
         @selected_obj_description = @obj.description
         ProductReviews::Board.display(@selected_obj, @selected_obj_description)
      end
   end

 end
