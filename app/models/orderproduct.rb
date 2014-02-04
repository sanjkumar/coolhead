class Orderproduct < ActiveRecord::Base

  #scope :orderdate, where(:created_at => nil)

  attr_accessible :description, :price, :product_id, :quantity, :title

  belongs_to :order
  belongs_to :product


  def total_price
    product.price * quantity
  end


end