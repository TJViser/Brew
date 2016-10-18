class Beer < ApplicationRecord

  validates :name, :type, presence: true
  belongs_to :user

  mount_uploader :photo, PhotoUploader


end
