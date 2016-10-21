class Review < ApplicationRecord
  belongs_to :wishlist
  validates :rating, numericality: true, inclusion: {in: (0..5)}
end
