
class CommandLineInterface
    # ********** USER_INPUT **********

    # ********** GREETING **********
    def greet
        puts 'Welcome to [UNNAMED TV APP]'
        puts 'Please enter your name'
        username = gets.chomp
        puts `clear`
        puts "Hey #{username}!"
    end

# ********** SORT BY DAY **********    
    def ask_what_day
        puts "What day would you like to see TV listings for?"
        puts "  Sunday"
        puts "  Monday"
        puts "  Tuesday"
        puts "  Wednesday"
        puts "  Thursday"
        puts "  Friday"
        puts "  Saturday"
        puts "  All"
        input = gets.chomp
    end 
    
    def daily_timeslots(input)
        
        seeking = input.downcase
        if seeking == "sunday"
            Timeslot.sunday
            elsif seeking == "monday"
                Timeslot.monday
            elsif seeking == "tuesday"
                Timeslot.tuesday
            elsif seeking == "wednesday"
                Timeslot.wednesday
            elsif seeking == "thursday"
                Timeslot.thursday
            elsif seeking == "friday"
                Timeslot.friday
            elsif seeking == "saturday"
                Timeslot.saturday
            else
                puts "ur dumb"
            end
    end
    def daily_results(input)
        dts = daily_timeslots(input)
        Timeslot.daily_shows(dts)
    end
    
end  
    
    



















# puts `clear`
        # if day.downcase == "sunday"
        #     Timeslot.find_by(day: 0).shows.each {|show| puts show.title}
        # elsif day.downcase == "monday"
        #     Timeslot.find_by(day: 1).shows.each {|show| puts show.title}
        # elsif day.downcase == "tuesday"
        #     Timeslot.find_by(day: 2).shows.each {|show| puts show.title}
        # elsif day.downcase == "wednesday"
        #     Timeslot.find_by(day: 3).shows.each {|show| puts show.title}
        # elsif day.downcase == "thursday"
        #     Timeslot.find_by(day: 4).shows.each {|show| puts show.title}
        # elsif day.downcase == "friday"
        #     Timeslot.find_by(day: 5).shows.each {|show| puts show.title}
        # elsif day.downcase == "saturday"
        #     Timeslot.find_by(day: 6).shows.each {|show| puts show.title}
        # else
        #     puts "lolol"















