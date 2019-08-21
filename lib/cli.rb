
require 'pry'

class CommandLineInterface
# ********** GEM SETUP **********
    def prompt
        TTY::Prompt.new(active_color: :bold)
    end

    def artsy
        Artii::Base.new
    end
# ********** USER_INPUT **********
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
            elsif seeking == "all"
                Timeslot.all
            else
                false
            end
    end
# ********** GREETING **********
    def welcome_screen
        puts artsy.asciify('WeeklyWatcher')
        puts 'Welcome to WeeklyWatcher'
        # welcome_choices = {
        #     'Access my user account' => login,
        #     'Browse TV listings without logging in' => }

        # [
        #     {name:'Access my user account', value}
        # ]
        #    '' 
        # prompt.select("What would you like to do today?", welcome_choices, cycle: true)

    end

    def greet
        # puts 'Welcome to [WEEKLY WATCHER]'
        # puts 'Welcome to WeeklyWatcher'
        puts 'Please enter your username'
        username = gets.chomp
        puts `clear`
            # if User.names.include?(username)
            # puts "Hey #{username}, it's great to have you back!"
            # else User.find_or_create_by(name: username)
            #     puts "Hey #{username}, it's great to meet you!"
            # end
    end
    
# ********** APP NAVIGATION **********
    def search_again
        puts ""
        puts "●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○"
        puts ""
        puts 'Would you like to search again?(yes/no)'
        answer = gets.chomp
        if answer.downcase == "yes"
            puts `clear`
            return_to_main
        elsif answer.downcase == "no"
            close_screen
        else
            search_again_typo
        end
    end

    def search_again_typo
        puts "Oops, I think there's a typo!"
        search_again
    end

    def close_screen
        puts `clear`
        'Thanks for using WeeklyWatcher!'
    end
   
# ********** SORT BY DAY **********    
   def prompt_day
        days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
        prompt.select('What day would you like to see TV listings for?', days, per_page: days.count)
        # binding.pry
   end

    def ask_what_day
        prompt_day
        # puts "What day would you like to see TV listings for?"
        # puts "  Sunday"
        # puts "  Monday"
        # puts "  Tuesday"
        # puts "  Wednesday"
        # puts "  Thursday"
        # puts "  Friday"
        # puts "  Saturday"
        # puts "  All"
        # input = gets.chomp
        # puts `clear`
    end 
    
    
    
    def daily_results(input)
        if daily_timeslots(input)
            puts `clear`

            dts = daily_timeslots(input)
        
            listings = Timeslot.daily_shows(dts)
            listings.map {|show| 
                puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}" }
                search_again
        else
        puts `clear`

        puts "I've never heard of that day. Please try again!"
        return_to_main
         end
    end
    def return_to_main
        daily_results(ask_what_day)
    end

    def readable_time(t)
        s = t.to_s
        h = s[0] + s[1]
        m = s[2] + s[3]
        mil_time = h.to_i
        if mil_time > 12
            mil_time -= 12
            h = mil_time.to_s
        end
        
        "#{h}:#{m} PM"
        # search_again
        # binding.pry
    end


    # def whoisyou
    #     promprompt.ask("Please enter your name")
    # end
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















