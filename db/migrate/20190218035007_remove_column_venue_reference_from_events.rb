class RemoveColumnVenueReferenceFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :venue, foreign_key: true
  end
end
