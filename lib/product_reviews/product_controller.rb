
#gem controller
 class ProductReviews::ProductController


    def call
      greetings
      create_main_objects
      @validator = ProductReviews::Input_handler.new
      main_catagories_list (@objects_created)
      subcatagories_list(@objects_created, @input)
      ProductReviews::Board.choice(@selected_obj[@input_2.to_i], @validator)
    end

    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
      puts " "
      puts "Loading  ... "
      puts " "
    end

    def create_main_objects
      if  ProductReviews::Catagories.all.empty?
        ProductReviews::Scraper.catagory
        @objects_created = ProductReviews::Catagories.all
        add_subcatagories(@objects_created)
      else
        @objects_created = ProductReviews::Catagories.all
      end
    end

    def add_subcatagories(objects_created)
  #    objects_created.each do |obj|
  #      obj.subcatagories << ProductReviews::Scraper.profile_page(obj.url)
  #      obj.subcatagories.flatten!
  #    end
      objects_created
    end

    def main_catagories_list (objects_created)
      @objects_created = objects_created
      @objects_created.each.with_index(1) do |obj, i |
    binding.pry
        obj.subcatagories << ProductReviews::Scraper.profile_page(obj.url)
        obj.subcatagories.flatten!
          puts "#{i} #{obj.name}"
        end

#======Prompt========#
          puts " "
          puts "Choose a catagory or type:\n |'exit' to terminate|\n |'sort' to arrange in accending order base on subcatagories|\n\n"
          @input = gets.downcase.strip!
          puts ""
#======End of Prompt========#
            if @input == "exit"
                @validator.exit
              elsif  @input == "sort"
                @objects_created = @validator.send(@input)
                main_catagories_list(@objects_created)
              elsif
                @validator.valid_catagories(@objects_created, @input)
              else
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

        if @input_2 == "exit"
          @validator.exit

        elsif @validator.valid_catagories(@selected_obj.reject.with_index{|v, i|  i==0 }, @input_2.to_i)

          ProductReviews::Board.display(@selected_obj[@input_2.to_i], @selected_obj[0][:description])
         else
           subcatagories_list(@objects_created, @input)
        end
    end

#FIN

 end
