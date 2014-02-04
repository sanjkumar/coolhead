class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :image_url
      t.references :products

      t.timestamps
    end
    add_index :brands, :products_id
  end
end
