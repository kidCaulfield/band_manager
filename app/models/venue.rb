class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates(
    :name,
    uniqueness: true
  )
end
