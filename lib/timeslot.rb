class Timeslot < ActiveRecord::Base
    has_many :shows
    has_many :showusers, through: :shows

  
end
