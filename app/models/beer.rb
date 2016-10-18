class Beer < ApplicationRecord

  validates :name, :type, presence: true
  belongs_to :user


end
