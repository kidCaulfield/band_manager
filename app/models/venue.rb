class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :events, through: :event_venues

  validates(
    :name,
    uniqueness: true
  )
end
