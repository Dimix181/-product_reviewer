class ProductReviews::Subcategories
  attr_accessor :name, :description, :best_product, :quick_description, :url

  def self.subcategory
    subcategories.name
    subcategories.description
    subcategories.best_product
    subcategories.quick_description
    subcategories.url
  end

end
