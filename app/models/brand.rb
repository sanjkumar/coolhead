class Brand < ActiveRecord::Base

  attr_accessible :image_url, :name, :product

  belongs_to :products

end
