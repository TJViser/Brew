class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cp, :integer
    add_column :users, :address, :string
    add_column :users, :country, :string
  end
end
