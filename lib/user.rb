class User < ActiveRecord::Base
    has_many :join_usertimeslots
    has_many :shows, through: :join_usertimeslots

end
