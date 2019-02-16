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
      :aasm_state,
      :created_at,
      :updated_at
      )
    end
end
