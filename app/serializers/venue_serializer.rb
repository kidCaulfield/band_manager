class VenueSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :address,
    :geo,
    :created_at,
    :updated_at
  ) 
end
