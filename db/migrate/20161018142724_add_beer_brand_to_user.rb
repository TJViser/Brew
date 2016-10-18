class AddBeerBrandToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :beer_brand, :string
  end
end
