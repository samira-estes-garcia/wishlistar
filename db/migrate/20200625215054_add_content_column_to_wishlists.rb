class AddContentColumnToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :content, :text
  end
end
