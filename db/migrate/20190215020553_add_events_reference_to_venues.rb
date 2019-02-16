class AddEventsReferenceToVenues < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :user, index: true
  end
end
