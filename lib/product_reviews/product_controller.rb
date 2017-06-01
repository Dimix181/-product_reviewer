
#gem controller
 class ProductReviews::ProductController
    def call
      greetings
      menu
      goodbye
    end


    def greetings
      puts "****** Welcome to The Product Reviewer ******"
      puts "*******************************************"
      puts "Thanks to thewirecutter.com for making this possible"
      puts "*******************************************"
      puts "You can press 0 at anytime to exit!"
    end

    def menu
      puts "Choose a Catagory to Get Started"
      puts "Headphones"
      puts "Computers"
      puts "Headphones"
      puts "HomeSweet Home"
      puts "Electronic"
    end

    def goodbye
      puts "Thank you for using the Product Reviewer"
      puts "See you again for the best review in the Planet" 
    end


 end
