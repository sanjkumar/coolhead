module ProductsHelper

  def join_tags(products)
    product.tags.map { |t| t.name }.join(", ")
  end

end
