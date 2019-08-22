
require 'pry'

class CommandLineInterface
    attr_reader :current_user

    def current_user=(user_obj)
        @current_user = user_obj
    end
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
            menu.choice 'Access(or create) my user account', -> {new_or_return_user}
            menu.choice 'Browse TV listings without logging in', -> {ask_how_to_search}
            menu.choice 'Exit Program', -> { close_screen }
          end
    end
# ********** USER **********
    def new_or_return_user
        prompt.select("Have you already created a username?") do |menu|
            menu.choice 'Yup', -> {returning_user}
            menu.choice 'Nope', -> {new_user}
          end
    end

    def returning_user
        puts `clear`
        puts "What is your username?"

        username = gets.chomp      
        me = User.all.find {|acct| 
            # binding.pry
            acct.name.downcase == username.downcase}
            
        if me
            puts `clear`
            puts "Hey #{username.capitalize}, it's great to have you back!"
            puts ""
            
            @current_user = me
            user_schedule
        else
            # puts "Sorry, we couldn't find that username in our system. Would you like to create an account?"
            prompt.select("Sorry, we couldn't find that username in our system. Would you like to try again or create an account?") do |menu|
                menu.choice 'Try again', -> {returning_user}
                menu.choice 'Create an account', -> {new_user}
                menu.choice 'Browse TV listings without an account', -> {ask_how_to_search}
              end
        end
    end

    def user_schedule
        if current_user.shows.count >= 1
            puts "You have some great TV shows in your schedule this week!"
        end
        puts ""
            current_user.shows.map {|show| 
            puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}" }
        prompt.select("Select and option below:") do |menu|
            menu.choice 'My schedule''s looking pretty empty. I''d like to add a show to it.', -> {add_show}
            menu.choice 'I need some outside time. I''d like to remove a show from my schedule',  -> {remove_show}
            menu.choice 'What else is out there? I''d like to browse TV listings',  -> {ask_how_to_search}
            menu.choice 'Got what I came 4. Goodbye.', -> {close_screen}
        end
    end

  
    def new_user
        # puts `clear`
        puts "Please enter your new username:"
        username = gets.chomp
            if User.username_exists(username)
                username_taken
            else
               @current_user = User.create(name: username.downcase)
               user_schedule
            end
    end

    def username_taken
        puts "Sorry, someone else already claimed that username. Please try something else:"
        puts ""
        new_user
    end
# ********** APP NAVIGATION **********    
  
    def add_show
        Show.puts_titles

        puts "Please enter the name of the show you'd like to add to you schedule:"
        input = gets.chomp
        show_to_add = Show.all.find {|show|
        show.title.downcase == input.downcase}
        if show_to_add
            # binding.pry
            ShowUser.create(show_id: show_to_add.id, user_id: current_user.id)
            puts "SUCCESS! Here's your current WeeklyWatcher Schedule"
            user_schedule
        else
            add_show_again
        end
        # binding.pry
    end
    def add_show_again 
        puts `clear`
        puts "Hmmm. I haven't heard of that show. Try again:"
        add_show
    end
    def remove_show
        puts "Please enter the name of the show you'd like to remove from your schedule:"
        puts ""
        input = gets.chomp 
        show_to_remove = current_user.shows.find {|show|
        show.title.downcase == input.downcase}
        if show_to_remove
            obj_to_delete = ShowUser.all.find_by(show_id: show_to_remove.id, user_id: current_user.id)
            # binding.pry
            obj_to_delete.destroy
        else
            puts "Hmmm. I haven't heard of that show."
        end
        user_schedule
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
    end

    def search_again_typo
        puts "Oops, I think there's a typo!"
        search_again
    end

    def close_screen
        puts `clear`
        puts "Thanks 4 using WeeklyWatcher!"
    end
   
# ********** SORT BY DAY **********    
    
    def ask_time_again
        hourly_results(ask_what_time)
    end

    def ask_day_again
        daily_results(ask_what_day)
    end

    def ask_what_time
        puts "What time would you like to see TV listings for? "
        puts "1.  8:00 PM"
        puts "2.  9:00 PM"
        time_response = gets.chomp
      end

      def hourly_timeslots(input)
          time_response = input.to_i
        if time_response == 1
          t8_obj = Timeslot.all.select {|indiv_ts| indiv_ts.start_time == 2000}
        elsif time_response == 2
          t9_obj = Timeslot.all.select {|indiv_ts| indiv_ts.start_time == 2100}
        else
          false
        end
      end

    def ask_how_to_search
        puts "Would you like to search by Day or Time?"
        response = gets.chomp
        if response.downcase == "day"
            daily_results(ask_what_day())
        elsif response.downcase == "time"
            hourly_results(ask_what_time())
        else
            puts"Invalid Input"
            ask_how_to_search_again()
        end
    end

    def ask_how_to_search_again
        ask_how_to_search
    end

    # def greet_orig
    #     # puts 'Welcome to [WEEKLY WATCHER]'
    #     puts 'Welcome to WeeklyWatcher'
    #     puts 'Please enter your name'
    #     username = gets.chomp
    #     puts clear
    #     puts "Hey #{username}!"
    #     User.find_or_create_by(name: username)
    # end

   
# *********************
def prompt_day
        days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday All)
        prompt.select('What day would you like to see TV listings 4?', days, per_page: days.count)
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
        ask_how_to_search_again
         end
    end
    
    # def return_to_main ORIG
    #     daily_results(ask_what_day)
    # end

    # def return_to_main 2
    #     ask_how_to_search
    # end

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
    
    


def hourly_results(input)
    if hourly_timeslots(input)
      puts `clear`

      hts = hourly_timeslots(input)
      h_listings = Timeslot.hourly_shows(hts)
      h_listings.map {|show|
      puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}"}
      search_again
    else
      puts `clear`

      puts "That is not a time on our schedule. Please choose 1 or 2."
      ask_time_again()
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















