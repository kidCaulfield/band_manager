class AddColumnVenueToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :venue, :json
  end
end
