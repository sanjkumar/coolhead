class AddNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :pay_type, :string
    add_column :orders, :status, :string
  end
end
