class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :price
      t.integer :stock
      t.string :description
      t.string :type
      t.float :alcohol
      t.float :conditionning

      t.timestamps
    end
  end
end
