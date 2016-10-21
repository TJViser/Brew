class Wishlist < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  has_many :reviews


  def dispatch
    self.sent = true
    self.save
  end

end
