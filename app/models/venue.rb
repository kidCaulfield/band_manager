class Venue < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
