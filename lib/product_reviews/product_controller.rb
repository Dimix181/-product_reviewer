
#gem controller
 class ProductReviews::ProductController


    def call

      greetings

      create_main_objects

        @objects_created = ProductReviews::Catagories.all

        main_catagories_list (@objects_created)
      system("clear")

        add_subcatagories(@objects_created)

        subcatagories_list(@objects_created)

        ProductReviews::Board.display(@selected_obj, @selected_obj_description)
        ProductReviews::Board.choice


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

          obj = array_of_obj[@input.to_i-1]

          array = ProductReviews::Scraper.profile_page(obj.url)

          array.each do |element|
            if element[:description] != nil
              obj.description = element[:description]
              else
              obj.subcatagories << element
            end
          end
      end

    def subcatagories_list(array_of_obj)

      obj = array_of_obj[@input.to_i-1]

      obj.subcatagories.each.with_index(1) do |obj, i|
          if obj[:title] != nil
            puts "#{i} #{obj[:title]}"
          end
        end
        puts " "
        @input = gets.downcase.strip

    if @input.to_i <= 0 || @input.to_i > obj.subcatagories.size

      puts "#{@input} It's and Invalid Option"
      puts "Try Again !!"

       main_catagories_list (@objects_created)
     else

       @selected_obj = obj.subcatagories[@input.to_i-1]
       @selected_obj_description = obj.description
    end

end




 end
