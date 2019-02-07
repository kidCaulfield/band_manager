class RenameColumnVenueInVenues < ActiveRecord::Migration[5.2]
  def change
    rename_column :venues, :venue, :name
  end
end
