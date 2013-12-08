class AddImageUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :imgage_url, :string
  end
end
