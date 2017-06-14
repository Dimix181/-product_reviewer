class ProductReviews::Catagory
  attr_accessor :name, :url, :description, :title, :winner, :summary, :price

  #scrapes the main page and adds each catagory and its url to a hash and places the hash into and array
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
  #adds the description,title,winning product, a summary and price into a hash of arrays
  def self.profile_page(url)
    doc = Nokogiri::HTML(open(url))
    grid_items = []

    grid_items << {
      description:  doc.search(".content p").inner_text}

      doc.search(".grid-item").each do |obj|

      grid_items  <<  {
      title: obj.search(".grid-title").inner_text ,
      winner: obj.search(".grid-make-model").inner_text ,
      summary: obj.search(".grid-summary").inner_text,
      price: obj.search(".grid-price").inner_text,
       }
      end
    self.sanitizer(grid_items)
  end
  #deletes and cleans up erroneous data

  def self.sanitizer (hash)
      hash.each do |key,value|
        if key[:description] == nil
        key[:summary].gsub!('Read More >','')
        end
      end
      hash.delete_if{|key,value| key[:title] == ''}
    end

end
