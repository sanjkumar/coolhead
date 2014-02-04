class Profile < ActiveRecord::Base

  attr_accessible :address, :firstname, :lastname, :mobile, :user_id
  
  belongs_to :user
  belongs_to :admin_user

  validates :firstname, :lastname, :mobile, :address, :presence => true
  validates :mobile, :numericality => {:greater_than_or_equal_to => 7}
    
end
