
#gem controller
 class ProductReviews::ProductController


    def call

      greetings

      create_main_objects

        @objects_created = ProductReviews::Catagories.all

        main_catagories_list (@objects_created)
      system("clear")

      @validator = ProductReviews::Input_handler.new
#binding.pry
        if  @validator.valid?(@input) == false
          main_catagories_list (@objects_created)
        end
#binding.pry
        add_subcatagories(@objects_created)
#binding.pry
        subcatagories_list(@objects_created)
#binding.pry
        ProductReviews::Board.display(@selected_obj, @selected_obj_description)
#binding.pry

    end

    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
      puts "Choose a Catagory to Get Started"
      puts " "

    end

    def create_main_objects
      main_productlist = ProductReviews::Scraper.catagory

      ProductReviews::Catagories.create_from_hashes(main_productlist)
    end

    def main_catagories_list (objects_created)
      objects_created.each.with_index(1) do |obj, i |

          puts "#{i} #{obj.name}"
        end
      puts " "
      @input = gets.downcase.strip!

    end

    def add_subcatagories(array_of_obj)
        #selects the object extracts the url
          obj = array_of_obj[@input.to_i-1]
          array = ProductReviews::Scraper.profile_page(obj.url)
          obj.save(array)
    end

    def subcatagories_list(array_of_obj)
#binding.pry
      obj = array_of_obj[@input.to_i-1]
#binding.pry
      obj.subcatagories.each.with_index do |obj, i|
          if obj[:title] != nil
            puts "#{i} #{obj[:title]}"
          end
        end
        puts " "
        @input = gets.downcase.strip
#binding.pry
        @selected_obj = obj.subcatagories[@input.to_i]
        @selected_obj_description = obj.subcatagories[0][:description]
    end




 end
