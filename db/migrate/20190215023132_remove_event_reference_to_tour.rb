class RemoveEventReferenceToTour < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :event_id
  end
end
