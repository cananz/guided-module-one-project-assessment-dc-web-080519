class Timeslot < ActiveRecord::Base
    has_many :shows
    has_many :show_users, through: :shows

  
end
