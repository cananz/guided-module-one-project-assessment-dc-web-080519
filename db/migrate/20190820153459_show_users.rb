class ShowUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :show_users do |t|
      t.integer :user_id
      t.integer :show_id
    end
  end
end

