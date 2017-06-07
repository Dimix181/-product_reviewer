class ProductReviews::Catagory
    attr_accessor :name, :url, :description, :title, :winner, :summary, :price

  def self.catagory
    doc =  Nokogiri::HTML(open("http://www.thewirecutter.com"))
    section = doc.search(".wire_leaderboard a.leaderboard-title-inner")
    product_list = []

     section.each do |obj|
       product_list << {
         name: obj.inner_text ,
          url: obj["href"]
        }
     end
     product_list
  end

  def self.profile_page(url)
    doc = Nokogiri::HTML(open(url))

    grid_items = []
    grid_items << {description:  doc.search(".content p").inner_text}
     doc.search(".grid-item").each do |obj|
        grid_items  <<  {
                title:  obj.search(".grid-title").inner_text ,
               winner:  obj.search(".grid-make-model").inner_text ,
              summary:  obj.search(".grid-summary").inner_text,
                price:  obj.search(".grid-price").inner_text
              }
      end
      grid_items
   end

end
