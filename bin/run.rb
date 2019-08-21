require_relative '../config/environment'
cli = CommandLineInterface.new
# binding.pry

a = Artii::Base.new
puts a.asciify('unnamed TV app')
cli.greet
# cli.ask_what_day
puts cli.daily_results(cli.ask_what_day)

# toomany = cli.daily_timeslot(ask_what_day)

0