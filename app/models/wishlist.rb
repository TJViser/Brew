class Wishlist < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :rating, numericality: true, inclusion: {in: (0..5)}

  def dispatch
    self.sent = true
  end

end
