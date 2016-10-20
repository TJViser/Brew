class RetroactiveDefaultRule < ActiveRecord::Migration[5.0]
  def change
    Beer.where(stock: nil).update_all(stock: 0)
  end
end
