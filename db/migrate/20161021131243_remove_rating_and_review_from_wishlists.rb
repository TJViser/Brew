class RemoveRatingAndReviewFromWishlists < ActiveRecord::Migration[5.0]
  def change
    change_table :wishlists do |t|
      t.remove :rating, :review
  end
end
end

