class Event < ApplicationRecord
  belongs_to :tour
  has_many :venues, through: :event_venues
end
