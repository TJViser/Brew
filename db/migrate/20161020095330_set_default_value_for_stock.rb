class SetDefaultValueForStock < ActiveRecord::Migration[5.0]
  def change
    change_column_default :beers, :stock, default: 0
  end
end
