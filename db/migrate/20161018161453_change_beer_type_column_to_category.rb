class ChangeBeerTypeColumnToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :beers, :type, :category
  end
end
