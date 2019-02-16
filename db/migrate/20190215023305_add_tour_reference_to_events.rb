class AddTourReferenceToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :tour, foreign_key: true
  end
end
