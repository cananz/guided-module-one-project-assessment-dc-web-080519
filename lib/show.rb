class Show < ActiveRecord::Base
    has_many :show_users
    belongs_to :timeslot
    has_many :users, through: :show_users

    # def 
        # mon = Timeslot.monday
        
    # end
    def day_of_week
        day_num = self.timeslot.day
            if day_num == 0
                "Sunday"
            elsif day_num == 1
                "Monday"
            elsif day_num == 2
                "Tuesday"
            elsif day_num == 3
                "Wednesday"
            elsif day_num == 4
                "Thursday"
            elsif day_num == 5
                "Friday"
            elsif day_num == 6
                "Saturday"
            end
    end

    def time
        self.timeslot.start_time
    end

    def self.titles
        self.all.map {|show_obj|
        show_obj.title}
    end

    def self.puts_titles
        self.titles.each {|t|
        puts t}
    end
end
