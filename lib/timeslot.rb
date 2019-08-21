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
        days_shows = daily_timeslots.map{|tslot| tslot.shows}
        days_shows.flatten
    end
    
    

    

    # def shows(timeslot_array)
    #     self.each {|tslot| tslot.show.title}
    # end
    def day_to_num(day) # "day" -> :day value
        # if day.downcase == "sunday"
        #     day = 0
        # elsif day.downcase == "monday"
        #     day = 1
        # elsif day.downcase == "tuesday"
        #     day = 2
        # elsif day.downcase == "wednesday"
        #     day = 3
        # elsif day.downcase == "thursday"
        #     day = 4
        # elsif day.downcase == "friday"
        #     day = 5
        # elsif day.downcase == "saturday"
        #     day = 6
        # else 
        #     nil
        # end
    end
  
    def self.find_by_day(day)
        if day.downcase == "sunday"
            day = 0
        elsif day.downcase == "monday"
            day = 1
        elsif day.downcase == "tuesday"
            day = 2
        elsif day.downcase == "wednesday"
            day = 3
        elsif day.downcase == "thursday"
            day = 4
        elsif day.downcase == "friday"
            day = 5
        elsif day.downcase == "saturday"
            day = 6
        end
        # tday = day_to_num(day)
        var = Timeslot.all.select {|tslot| tslot.day == day}
        var.map {|slot| Show.all.timeslot_id == self}
    end
end
