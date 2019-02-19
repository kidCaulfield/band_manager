class Event < ApplicationRecord
  belongs_to :tour
  belongs_to :venue
end
