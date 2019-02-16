class AddEventReferenceToTour < ActiveRecord::Migration[5.2]
  def change
    add_reference :tours, :event, foreign_key: true
  end
end
