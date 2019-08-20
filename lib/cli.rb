
class CommandLineInterface
# ********** GREETING METHODS **********

    def greet
        puts 'Welcome to [unnamed]'
        puts "Please enter your name"
        username = gets.chomp
        puts "Hey #{username}"
    end
    
    
    def ask_what_day
        puts "What day would you like to see TV listings for?"
        puts "  Sunday"
        puts "  Monday"
        puts "  Tuesday"
        puts "  Wednesday"
        puts "  Thursday"
        puts "  Friday"
        puts "  Saturday"
        
        day = gets.chomp
        if day.downcase == "sunday"
            Timeslot.find_by(day: 0).shows.each {|show| 
                puts ""
                puts show.title
                puts ""}
            
            
        else
            puts "FU"
        end

        
          
    end


end

# cli.greet
# gets.chomp

# puts "How would you like to search for a TV show?"
# #1. find the show by all shows
#   # find.all
# #2. find the show by hourly schedule
#   # find_by_hour
# #3. find the show by daily schedule
#   # find_by(day: )
# #4. find the show by name
#   # if Show.name == userinput then return that show& its info
#   # Show.find_by(name: "user input")
# gets.chomp
# # 1. either select a show or filter further by hour || day
# # 2. can add a show to schedule
# # 3. can choose a show or choose to pick a different day
# once they are on the show they can decide to add it to their schedule

