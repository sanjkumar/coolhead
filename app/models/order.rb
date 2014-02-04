class Order < ActiveRecord::Base

  attr_accessible :name, :email, :pay_type, :order_date, :user_id, :status, :card_number, :expiry_date, :cvc

  belongs_to :user
  has_many :orderproducts, :dependent => :destroy

  PAYMENT_TYPES = [ 'Debit Card', 'Credit card', 'PayPal' ]


  validates :name, :email, :pay_type, :card_number, :expiry_date, :cvc, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  STATUS_TYPES = ['shipped', 'pending']

end