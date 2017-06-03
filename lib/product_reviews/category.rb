class ProductReviews::Category
    attr_accessor :name, :description, :subcategory, :url

  def self.catagory
    doc =  Nokogiri::HTML(open("http://www.thewirecutter.com"))

    puts "1 - Headphones"
    puts "2 - Computers"
    puts "3 - Headphones"
    puts "4 - HomeSweet Home"
    puts "5 - Electronic"
binding.pry
    category_1 = self.new
    category_1.name = "Headphones"
    category_1.description = "From cheap earbuds to replace the ones that came with your phone to high-end over-ear headphones, our experts (and their listening panels) find the best headphones in every category so you can get the best sound for your buck. We list both wired and wireless options to make sure you can listen to your favorite songs or podcasts in every situation you might want to."

    category_1.subcategory = "[The Best Gaming Headsets{winner:'Kingston HyperX Cloud' price:'Amazon $80'}, The Best Earbuds{winner:'Bang & Olufsen Beoplay H3' price:'Amazon $150'}, The Best Wireless Earbuds {winner:'Phiaton BT 100 NC' price'Amazon $100'},The Best Bluetooth Headphone Adapter{winner:'BlueAnt Ribbon' price:'TechRabbit $15'}, The Best Noise-Cancelling Headphones{winner:'Bose QuietComfort 25' price:'Amazon #$300'}, The Best True Wireless Headphones So Far{winner:'nil'},The Best Wireless Earbuds Under $50{winner:'Anker Soundbuds Sport IE20' price:'Amazon $32'} ]"
    category_1.url         = "http://thewirecutter.com/leaderboard/headphones/"

#    category_2 = self.new
#    category_2.name
#    category_2.description
#    category_2.subcategory
#    category_2.url

#    category_3 = self.new
#    category_3.name
#    category_3.description
#    category_3.subcategory
#    category_3.url

#    category_4 = self.new
#    category_4.name
#    category_4.description
#    category_4.subcategory
#    category_4.url

#    category_5 = self.new
#    category_5.name
#    category_5.description
#    category_5.subcategory
#    category_5.url

    [category_1]
  end

end
