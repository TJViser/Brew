class AddDefaultToStock < ActiveRecord::Migration[5.0]
  def change
    change_column :beers, :stock, :integer, default: 0
  end
end
