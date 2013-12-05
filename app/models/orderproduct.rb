class Orderproduct < ActiveRecord::Base

  attr_accessible :description, :price, :product_id, :quantity, :title

  belongs_to :order
  belongs_to :product


  def total_price
    product.price * quantity
  end


end