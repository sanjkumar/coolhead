class Product < ActiveRecord::Base
  
  scope :unreleased, where(:created_at => nil)
  #default_scope :order => 'title'

  attr_accessible :category, :description, :image_url, :model, :price, :title, :product_id
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  #validates :model, :uniqueness => true
  #validates :image_url, :format => {:with=> %r{\.(gif|jpg|png)$}i, :message => 'must be a URL for GIF, JPG or PNG image.'}

  has_many :orderproducts
  has_many :orders, :through => :orderproducts

  has_one :brands

    #has_and_belongs_to_many :categories

  #before_destroy :ensure_not_referenced_by_any_line_item
#  scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id =?', cid])}

#  def ensure_not_referenced_by_any_line_item
#
 #   if line_items.count.zero?
  #    return true
   # else
    #  errors.add(:base, 'Line Items present' )
    #  return false
   # end
 # end

end
