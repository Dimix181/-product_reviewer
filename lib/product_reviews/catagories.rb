
class ProductReviews::Catagories
  attr_accessor :name, :url, :subcatagories, :description

  @@all = []

  def self.all
      @@all
  end



    def initialize(hash)
      hash.each do |key,value|
        self.send("#{key}=", value)
          end
      @@all << self
      @subcatagories = []
    end

    def self.sort_by_num_subcatagories
      #return all catagories objects but sorted by the number of subcatagories - descending order
      "hello"
      sorted_array =  ProductReviews::Catagories.all.sort_by do |obj|
         obj.subcatagories.size
      end
      sorted_array
    end

end
