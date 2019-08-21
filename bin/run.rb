require_relative '../config/environment'
cli = CommandLineInterface.new

a = Artii::Base.new
prompt = TTY::Prompt.new

puts a.asciify('WeeklyWatcher')
cli.greet
# cli.greet
# cli.ask_what_day

puts cli.daily_results(cli.ask_what_day)
# puts cli.search_again


# toomany = cli.daily_timeslot(ask_what_day)

# 0