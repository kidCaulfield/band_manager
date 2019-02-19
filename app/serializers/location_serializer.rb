class LocationSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :city,
    :lat,
    :lng,
    :country,
    :iso2,
    :region,
    :capital,
    :population,
    :population_proper
    )
end
