class CreateTimeslotsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.integer :day
      t.integer :time
    end
  end
end
