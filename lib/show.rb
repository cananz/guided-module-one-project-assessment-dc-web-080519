class Show < ActiveRecord::Base
    has_many :join_usertimeslots
    belongs_to :timeslot
    has_many :users, through: :join_usertimeslots

end
