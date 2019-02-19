class VenueSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :address,
    :geo,
    :created_at,
    :updated_at
  ) 

  has_many :reviews
  has_many :events

  class ReviewsSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :body,
    :created_at,
    :updated_at
    )
  end
end
