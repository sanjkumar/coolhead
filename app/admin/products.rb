ActiveAdmin.register Product do
   scope :unreleased
  
  index do
    column :title
    column :category
    column 'Release Date', :created_at
    column :price, :sortable => :price do |product|
       div :class => 'price' do
            number_to_currency product.price, :unit => '&euro;'
       end
    end
      default_actions
  end
  
end
