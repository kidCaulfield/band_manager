class RemoveColumnVenueFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :venue, :json
  end
end
