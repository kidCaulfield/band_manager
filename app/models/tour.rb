class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
end
