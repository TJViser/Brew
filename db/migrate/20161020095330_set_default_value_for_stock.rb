class SetDefaultValueForStock < ActiveRecord::Migration[5.0]
  def change
    change_column_default :beers, :stock, from: nil, to: 0
  end
end
