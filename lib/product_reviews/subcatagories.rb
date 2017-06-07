class ProductReviews::Subcatagories
  attr_accessor :name, :description, :best_product, :quick_description, :url

  def self.subcatagory
    subcatagories.name
    subcatagories.description
    subcatagories.best_product
    subcatagories.quick_description
    subcatagories.url
  end

end
