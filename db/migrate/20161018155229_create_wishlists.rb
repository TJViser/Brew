class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.integer :quantity
      t.references :beer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
