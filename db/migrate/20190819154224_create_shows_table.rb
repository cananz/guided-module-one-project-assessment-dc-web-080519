class CreateShowsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :genre
      t.integer :timeslot_id
    end
  end
end
