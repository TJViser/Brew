class AddRatingAndReviewToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :rating, :integer
    add_column :wishlists, :review, :text
  end
end
