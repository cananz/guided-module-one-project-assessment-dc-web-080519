class Show < ActiveRecord::Base
    has_many :join_usertimeslots
    belongs_to :timeslot
    # def initialize
        
    # end
end