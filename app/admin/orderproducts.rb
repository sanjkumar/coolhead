ActiveAdmin.register Orderproduct do

  index do
    column :title
    column :quantity
    column 'Order Date', :created_at
    column :price, :sortable => :price do |product|
      div :class => 'price' do
        number_to_currency product.price, :unit => '&euro;'
      end
    end
    column :product_id
    default_actions
  end
  
end
