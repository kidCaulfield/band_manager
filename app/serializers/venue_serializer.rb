class VenueSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :venue,
    :vicinity,
    :longitute,
    :latitude,
    :created_at,
    :updated_at
  ) 
end
