class Wishlist < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  def dispatch
    self.sent = true
    self.save
  end

end
