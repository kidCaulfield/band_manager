class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :lat
      t.string :lng
      t.string :country
      t.string :iso2
      t.string :region
      t.string :capital
      t.string :population
      t.string :population_proper

      t.timestamps
    end
  end
end
