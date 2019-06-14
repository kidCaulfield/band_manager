class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :events

  validates(
    :name,
    uniqueness: { scope: :address,
    message: "Venues of the Same name only alowed in different addresses" }
  )
end
