class Timeslot < ActiveRecord::Base
    has_many :shows
    has_many :show_users, through: :shows


    def self.sunday
        self.all.select {|tslot| tslot.day == 0}
    end
    def self.monday
        self.all.select {|tslot| tslot.day == 1}
    end
    def self.tuesday
        self.all.select {|tslot| tslot.day == 2}
    end
    def self.wednesday
        self.all.select {|tslot| tslot.day == 3}
    end
    def self.thursday
        self.all.select {|tslot| tslot.day == 4}
    end
    def self.friday
        self.all.select {|tslot| tslot.day == 5}
    end
    def self.saturday
        self.all.select {|tslot| tslot.day == 6}
    end
    
    def self.daily_shows(daily_timeslots)
        if daily_timeslots
            days_shows = daily_timeslots.map{|tslot| tslot.shows}
            days_shows.flatten
        else
            false
        end
    end
    
    def self.hourly_shows(hourly_timeslots)
        if hourly_timeslots
            hour_shows = hourly_timeslots.map {|tslot|tslot.shows}
            hour_shows.flatten
            else
            false
        end
    end
    
    def shows
        Show.all.select {|show_obj| show_obj.timeslot == self}
    end

end

