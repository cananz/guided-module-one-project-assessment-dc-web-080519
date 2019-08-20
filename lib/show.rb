class Show < ActiveRecord::Base
    has_many :showusers
    belongs_to :timeslot
    has_many :users, through: :showusers

end
