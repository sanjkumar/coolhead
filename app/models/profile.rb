class Profile < ActiveRecord::Base

  attr_accessible :address, :firstname, :lastname, :mobile, :user_id
  
  belongs_to :user
  belongs_to :admin_user
    
end
