class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :contact
      t.string :aasm_state

      t.timestamps
    end
  end
end
