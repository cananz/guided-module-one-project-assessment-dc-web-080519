
# class CommandLineInterface
#     # ********** GREETING **********
#         def greet
#             puts 'Welcome to [unnamed]'
#             puts " Please enter your name"
#             username = gets.chomp
#             puts `clear`
#             puts "Hey #{username}"
#         end
    
#     # ********** MAIN MENU **********
#         def main_menu
#             puts "  A: View your schedule"
#             # FUNCTION HERE 
#             #  that returns entire results with join_usertimeslot for that user
#             puts "  B: Modify your schedule"
#             # FUNCTION HERE
#             # find_or_create_by timeslots so no timeslots repeat
#             # puts "Would you like to add a show or delete a show?"
#             # puts "  A: Add a show"
#             # puts "  B: Delete a show"
#             puts "  C: Browse this week's TV listings"
#             # FUNCTION HERE
#         end
        
#         def ask_what_day
#             puts "What day would you like to see TV listings for?"
#             puts "  Sunday"
#             puts "  Monday"
#             puts "  Tuesday"
#             puts "  Wednesday"
#             puts "  Thursday"
#             puts "  Friday"
#             puts "  Saturday"
#             day = gets.chomp
#             puts `clear`
#             if day.downcase == "sunday"
#                 Timeslot.find_by(day: 0).shows.each {|show| puts show.title}
#             elsif day.downcase == "monday"
#                 Timeslot.find_by(day: 1).shows.each {|show| puts show.title}
#             elsif day.downcase == "tuesday"
#                 Timeslot.find_by(day: 2).shows.each {|show| puts show.title}
#             elsif day.downcase == "wednesday"
#                 Timeslot.find_by(day: 3).shows.each {|show| puts show.title}
#             elsif day.downcase == "thursday"
#                 Timeslot.find_by(day: 4).shows.each {|show| puts show.title}
#             elsif day.downcase == "friday"
#                 Timeslot.find_by(day: 5).shows.each {|show| puts show.title}
#             elsif day.downcase == "saturday"
#                 Timeslot.find_by(day: 6).shows.each {|show| puts show.title}
#             else
#                 puts "lolol"
#             end 
#         end  
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#     end
    
    
    