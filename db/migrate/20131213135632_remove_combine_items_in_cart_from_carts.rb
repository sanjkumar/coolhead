class RemoveCombineItemsInCartFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts, :combine_items_in_cart
  end

  def down
    add_column :carts, :combine_items_in_cart, :integer
  end
end
