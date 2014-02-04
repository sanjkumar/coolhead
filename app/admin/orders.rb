ActiveAdmin.register Order do

  index do
    column :name
    column :email
    column :pay_type
    column :card_number
    column :expiry_date
    column 'Release Date', :created_at
    column :status, :sortable => :status do | order |
      STATUS_TYPES = 'shipped'
    end
    default_actions
  end
  
end
