class UsersSerializer < ActiveModel::Serializer
  
  attributes(
    :id,
    :first_name,
    :last_name,
    :email,
    :full_name,
    :created_at,
    :updated_at
  )
end
