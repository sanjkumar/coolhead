class Brand < ActiveRecord::Base
<<<<<<< HEAD
=======
  attr_accessible :name, :image_url
>>>>>>> 3b2aca57d1ff0de88236d44881cdb2f2a8a6ed52

  attr_accessible :image_url, :name, :product

  belongs_to :products

end
