class Timeslot < ActiveRecord::Base
    has_many :shows
    has_many :join_usertimeslots

  
end
