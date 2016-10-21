class Wishlist < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  def send
    self.sent = true
  end

end
