class Beer < ApplicationRecord

  validates :name, :category, presence: true
  belongs_to :user
  has_many :wishlists, dependent: :destroy


  mount_uploader :photo, PhotoUploader


end
