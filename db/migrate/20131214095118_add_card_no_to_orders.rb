class AddCardNoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_number, :integer
    add_column :orders, :expiry_date, :date
    add_column :orders, :cvc, :integer
  end
end
