class Order < ActiveRecord::Base

  attr_accessible :name, :email, :pay_type, :order_date, :user_id

  belongs_to :user
  has_many :orderproducts, :dependent => :destroy

  PAYMENT_TYPES = [ 'Debit Card', 'Credit card', 'PayPal' ]

  validates :name, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES



end