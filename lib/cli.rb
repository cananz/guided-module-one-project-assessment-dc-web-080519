
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
        prompt.select("What would you like to do today?") do |menu|
            menu.choice 'Access(or create) my user account', -> {login}
            menu.choice 'Browse TV listings without logging in', -> {return_to_main}
            menu.choice 'Exit Program', -> { close_screen }
          end
    end
    def login
        # prompt.yes?("Have you already created a username?") do |q|
        #     q.suffix 'Yup/nope'
        #   end
        prompt.select("Have you already created a username?") do |menu|
            menu.choice 'Yup', -> {returning_user}
            menu.choice 'Nope', -> {new_user}
          end
    end
    def returning_user
        puts `clear`
        puts "What is your username?"

        username = gets.chomp      
        current_user = User.all.find {|acct| 
            # binding.pry
            acct.name.capitalize == username.capitalize}

        if current_user   
            puts `clear`
            puts "Hey #{username.capitalize}, it's great to have you back!"
            puts ""
            user_schedule(current_user.shows)
        else
            puts "Sorry, we couldn't find that username in our system. Would you like to create an account?"
        end
    end
    def user_schedule(show_objs)
        puts "You have some great TV shows in your schedule this week!"
        puts ""
        show_objs.map {|show| 
            puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}" }
        prompt.select("Select and option below:") do |menu|
            menu.choice 'My schedule''s looking pretty empty. I''d like to add a show to it.'#, -> {}
            menu.choice 'I need some outside time. I''d like to remove a show from my schedule'#,  #-> {}
            menu.choice 'What else is out there? I''d like to browse TV listings'#,  #-> {}
            menu.choice 'Got what I came for. Goodbye.', -> {close_screen}
        end
    end
    # def current_user=(user_object)
    #     user_object
    # end
    def new_user
    end

    def greet
        puts artsy.asciify('WeeklyWatcher')
        puts 'Welcome to WeeklyWatcher'
        prompt.select("What would you like to do today?") do |menu|
            menu.choice 'Access(or create) my user account', -> {login}
            menu.choice 'Browse TV listings without logging in', -> {return_to_main}
            menu.choice 'Exit Program', -> {close_screen}
          end
    end
    
# ********** APP NAVIGATION **********
    def search_again
        puts ""
        puts "●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○●○"
        puts ""
        searches = [
            {name: 'Search by Day', value: daily_results(ask_what_day)},
            {name: 'Search by Time', value: hourly_results(ask_what_time)},
            {name: 'Return to Main Menu', value: welcome_screen},
            {name: 'Exit program', value: close_screen}]
        prompt.select("Would you like to search again?", searches)
            # puts 'Would you like to search again?(yes/no)'
        # answer = gets.chomp
        # if answer.downcase == "yes"
        #     puts `clear`
        #     return_to_main
        # elsif answer.downcase == "no"
        #     close_screen
        # else
        #     search_again_typo
        # end
    end

    def search_again_typo
        puts "Oops, I think there's a typo!"
        search_again
    end

    def close_screen
        puts `clear`
        puts 'Thanks for using WeeklyWatcher!'
    end
   
# ********** SORT BY DAY **********    
   def prompt_day
        days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
        prompt.select('What day would you like to see TV listings for?', days, per_page: days.count)
        # binding.pry
   end

    def ask_what_day
        prompt_day
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

        puts "hmmm... I've never heard of that day. Please try again!"
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















