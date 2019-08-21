class Show < ActiveRecord::Base
    has_many :show_users
    belongs_to :timeslot
    has_many :users, through: :show_users

    # def 
        # mon = Timeslot.monday
        
    # end
    def 
end
