class AddSentColumnToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :sent, :boolean, default: false
  end
end
