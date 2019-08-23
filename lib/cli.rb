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

    def font_special
        Artii::Base.new :font => "larry3d"
    end

# ********** WELCOME/CLOSE **********
    def welcome_screen
        puts `clear`
        puts font_special.asciify('Weekly')
        puts font_special.asciify('  Watcher')
        prompt.select("\nWhat would you like to do today?\n\n") do |menu|
            menu.choice 'Login or create account', -> {new_or_return_user}
            menu.choice 'Browse TV listings without logging in', -> {ask_how_to_search}
            menu.choice 'Exit Weekly Watcher', -> { close_screen }
          end
    end
    
    def close_screen
        puts `clear`
        # puts font_special.asciify('Weekly Watcher')
        puts ""
        puts font_special.asciify('Goodbye')
        puts ""
        puts 'Thanks for using Weekly Watcher!'
        " created by German, Marisa, & Peyton"
    end
# ********** USER LOGIN METHODS **********
    def new_or_return_user
        puts `clear`
        prompt.select("\nAre you an existing Weekly Watcher user?\n\n") do |menu|
            menu.choice 'Yes', -> {returning_user}
            menu.choice 'No', -> {new_user}
          end
    end

    def returning_user
        puts `clear`
        puts "\nWhat is your username?\n"
        puts ""
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
        end
        
    end

    def user_not_found
        prompt.select("\nSorry, we couldn't find that username in our system. \nWould you like to try again or create an account?\n\n") do |menu|
            menu.choice 'Try again', -> {returning_user}
            menu.choice 'Create an account', -> {new_user}
            menu.choice 'Browse TV listings without an account', -> {ask_how_to_search}
            menu.choice "Exit Weekly Watcher", -> {close_screen}
          end
    end


    def new_user
        # puts `clear`
        puts "\nPlease enter your new username:\n"
        username = gets.chomp
            if User.username_exists(username)
                username_taken
            else
               @current_user = User.create(name: username.downcase)
               user_schedule
            end
    end

    def username_taken
        puts `clear`
        puts ""
        puts "Sorry, someone else already claimed that username. Please try something else."
        puts ""
        new_user
    end

    # ********** USER SCHEDULE **********

    def user_schedule
        if current_user.shows.count >= 1
            puts ""
            puts "You have some great TV shows in your schedule this week!"
        end

        puts ""
            current_user.shows.map {|show| 
        puts "  #{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}" }
        puts ""
        puts ""
        user_schedule_followup
    end
    
    def user_schedule_followup
        prompt.select("\nSelect an option below:\n\n") do |menu|
            menu.choice "My schedule's looking pretty empty. I'd like to add a show to it.", -> {add_show}
            menu.choice "I need some outside time. I'd like to remove a show from my schedule.",  -> {remove_show}
            menu.choice "I'd like to browse TV listings.",  -> {ask_how_to_search}
            menu.choice "Exit Weekly Watcher.", -> {close_screen}
        end
    end
  
    
# ********** USER SCHEDULE ADD/REMOVE **********    
  
    def add_show
        # Show.puts_titles
        Show.all.map {|a_show| 
            puts "      #{a_show.day_of_week} at #{readable_time(a_show.time)} -- #{a_show.title}" }
        puts ""
        puts "Please enter the name of the show you'd like to add to you schedule:\n"
        
        input = gets.chomp
        
        show_to_add = Show.all.find {|show| show.title.downcase == input.downcase}
        
            if show_to_add
                # binding.pry
                ShowUser.create(show_id: show_to_add.id, user_id: current_user.id)
                puts `clear`
                puts "\n\nSUCCESS! #{show_to_add.title} has been added to your schedule! Here's your current Weekly Watcher schedule:\n\n"
                user_schedule
            else
                add_show_again
            end
        # binding.pry
    end

    def add_show_again 
        puts `clear`
        puts "\n\nHmmm. I haven't heard of that show. Try again:\n\n"
        add_show
    end

    def remove_show
        puts "\nPlease enter the name of the show you'd like to remove from your schedule:\n"
        input = gets.chomp 
        show_to_remove = current_user.shows.find {|show|
        show.title.downcase == input.downcase}
        if show_to_remove
            obj_to_delete = ShowUser.all.find_by(show_id: show_to_remove.id, user_id: current_user.id)
            # binding.pry
            obj_to_delete.destroy
            puts `clear`
            puts "\n\nSUCCESS! #{show_to_remove.title} has been removed from your schedule! Here's your current Weekly Watcher schedule"
        else
            puts "\nHmmm. I haven't heard of that show.\n"
        end
        user_schedule
    end
# ********** APP NAVIGATION **********
    
    def ask_how_to_search
        puts `clear`

        prompt.select("\nHow would you like to browse?\n\n") do |menu|
            menu.choice "View all", -> {browse_all_listings}
            menu.choice "Filter by day", -> {daily_results(ask_what_day)}
            menu.choice "Filter by time", -> {hourly_results(ask_what_time)}
            menu.choice "Exit Weekly Watcher", -> {close_screen}
        end

        # response = gets.chomp
        #     if response.downcase == "day"
        #         daily_results(ask_what_day)
        #     elsif response.downcase == "time"
        #         hourly_results(ask_what_time)
        #     else
        #         puts"Invalid Input"
        #         ask_how_to_search_again
        #     end
    end

    def ask_how_to_search_again
        ask_how_to_search
    end

    def browse_all_listings
        puts "\n"
        Timeslot.daily_shows(Timeslot.all).map {|show|    
            puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}" }
        search_again

    end
    
    
    def search_again

        prompt.select("\n\n\nWhat would you like to do next?\n\n") do |menu|
            menu.choice "Filter by day", -> {daily_results(ask_what_day)}
            menu.choice "Filter by time", -> {hourly_results(ask_what_time)}
            menu.choice "Return to main menu", -> {welcome_screen}
            menu.choice "Exit Weekly Watcher", -> {close_screen}
        end
    end

    def search_again_typo
        puts "\nOops, I think there's a typo!\n"
        search_again
    end



   
  
# ********** FILTER BY TIME **********  
    def ask_what_time
        puts "\nEnter the corresponding number for the time you would like to see:"
        puts "1.  8:00 PM"
        puts "2.  9:00 PM"
        time_response = gets.chomp
    end
    
    def ask_time_again
        hourly_results(ask_what_time)
    end

    def hourly_results(input)
        if hourly_timeslots(input)
            puts `clear`
            puts ""
            hts = hourly_timeslots(input)
            h_listings = Timeslot.hourly_shows(hts)
            h_listings.map {|show|
            puts "#{show.day_of_week} at #{readable_time(show.time)} -- #{show.title}"}
          
          search_again
        else
          puts `clear`
    
          puts "\nThat is not a time on our schedule. Please choose 1 or 2."
          ask_time_again()
        end
    end
# ********** FILTER BY DAY **********  
    def ask_what_day
        prompt_day
    end 

    def ask_day_again
        daily_results(ask_what_day)
    end

    def prompt_day
        days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday All)
        prompt.select("What day would you like to see TV listings for?\n\n", days, per_page: days.count)
        # binding.pry
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


    # ********** COMPUTER <-> HUMAN TRANSLATORS **********
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




      
    
    



















