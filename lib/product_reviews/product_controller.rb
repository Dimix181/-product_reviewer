
#gem controller
 class ProductReviews::ProductController


    def call
        #greeting message
      greetings
        #creates objects from each catagory
      create_main_objects
        #all objects created
        @objects_created = ProductReviews::Catagories.all
        #display each objects name
        main_catagories_list (@objects_created)
      system("clear")

      @validator = ProductReviews::Input_handler.new
binding.pry
    if  @validator.valid?(@input) == false
      main_catagories_list (@objects_created)
  end
        add_subcatagories(@objects_created)
        subcatagories_list(@objects_created)
        #display the products info
        ProductReviews::Board.display(@selected_obj, @selected_obj_description)


    end

    def greetings
      puts "****** Welcome to The Product Reviewer ****"
      puts "*******************************************"
      puts "Choose a Catagory to Get Started"
      puts " "

    end

    def create_main_objects
      # gets all the catagories from index doc.
      main_productlist = ProductReviews::Scraper.catagory
      # creates an object from each element in the productlist
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
      obj = array_of_obj[@input.to_i-1]
      obj.subcatagories.each.with_index do |obj, i|
          if obj[:title] != nil
            puts "#{i} #{obj[:title]}"
          end
        end
        puts " "
        @input = gets.downcase.strip
        @selected_obj = obj.subcatagories[@input.to_i]
        @selected_obj_description = obj.subcatagories[0][:description]
    end




 end
