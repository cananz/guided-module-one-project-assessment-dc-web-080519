class Timeslot < ActiveRecord::Base
    has_many :shows
    has_many :show_users, through: :shows

    @@all = []

    def initialize

    end

    def find_by_day
    end
  
end
