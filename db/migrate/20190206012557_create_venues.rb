class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :venue
      t.string :vicinity
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
