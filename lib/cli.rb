require 'pry'

class CommandLineInterface

    # ********** USER_INPUT **********

    # ********** GREETING **********
    def greet
        # puts 'Welcome to [WEEKLY WATCHER]'
        puts 'Welcome to WeeklyWatcher'
        puts 'Please enter your name'
        username = gets.chomp
        puts `clear`
        puts "Hey #{username}!"
        User.find_or_create_by(name: username)
    end

    # ********How would you like to search*********
    # ******* DAY OR TIME ***********

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
    # ****** SORT BY TIME **********
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

    def ask_time_again
      hourly_results(ask_what_time)
    end

    def ask_day_again
      daily_results(ask_what_day)
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
        # puts `clear`

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
            elsif seeking == "all"
                Timeslot.all
            else
                false
            end
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
        ask_day_again()
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



    def return_to_main
        ask_how_to_search
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
       a = Artii::Base.new :font => "hollywood"
       puts `clear`
       puts a.asciify('See ya later!')
       'Thanks for using WeeklyWatcher!'

        # return nil
        # puts 'Come back anytime!'
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
