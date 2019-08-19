class CreateTimeslotsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.integer :day
      t.integer :start_time
      t.integer :end_time
    end
  end
end
