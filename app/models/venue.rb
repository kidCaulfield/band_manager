class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :events

  validates(
    :name,
    uniqueness: true
  )
end
