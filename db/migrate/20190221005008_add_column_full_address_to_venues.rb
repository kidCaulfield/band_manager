class AddColumnFullAddressToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :full_address, :string
  end
end
