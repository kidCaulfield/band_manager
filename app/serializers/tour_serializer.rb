class TourSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :band,
    :created_at,
    :updated_at
    )

    has_many :events

    class EventSerializer < ActiveModel::Serializer
      attributes(
      :id,
      :title,
      :date,
      :contact,
      :venue_id,
      :aasm_state,
      :created_at,
      :updated_at,
      :venue,
      :address
      )

      belongs_to :tour
      belongs_to :venue
    end
end
