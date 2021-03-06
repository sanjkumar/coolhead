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


  has_and_belongs_to_many :brands
  belongs_to :categories


  #scope :by_category_id, lambda {|cid| joins(:categories).where(['categories.id =?', cid])}


  
end
