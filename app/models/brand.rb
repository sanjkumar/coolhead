class Brand < ActiveRecord::Base
  attr_accessible :name, :image_url

  has_many :products
end
