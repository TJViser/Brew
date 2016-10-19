class ChangeColumnConditionning < ActiveRecord::Migration[5.0]
  def change
    change_column :beers, :conditionning, :string
  end
end
