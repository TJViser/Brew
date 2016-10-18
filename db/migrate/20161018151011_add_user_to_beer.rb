class AddUserToBeer < ActiveRecord::Migration[5.0]
  def change
    add_reference :beers, :user, foreign_key: true
  end
end
