class AddPhotoToBeer < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :photo, :string
  end
end
