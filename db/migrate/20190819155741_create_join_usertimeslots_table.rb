class CreateJoinUsertimeslotsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :join_usertimeslots do |t|
      t.integer :show_id
      t.integer :user_id
      t.integer :timeslot_id
    end
  end
end
