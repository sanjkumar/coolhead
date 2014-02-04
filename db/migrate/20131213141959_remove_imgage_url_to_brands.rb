class RemoveImgageUrlToBrands < ActiveRecord::Migration
  def up
    remove_column :brands, :image_url
  end

  def down
    add_column :brands, :image_url, :string
  end
end
