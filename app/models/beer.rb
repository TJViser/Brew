class Beer < ApplicationRecord

  validates :name, :type, presence: true


end
