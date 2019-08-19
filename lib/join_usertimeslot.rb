class Join_usertimeslot < ActiveRecord::Base
    belongs_to :user
    belongs_to :show
    belongs_to :timeslot
    # def initialize
        
    # end
end