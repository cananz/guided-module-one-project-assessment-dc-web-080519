class ShowUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :show
    # belongs_to :timeslot #, through: :shows

end
