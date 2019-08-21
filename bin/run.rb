require_relative '../config/environment'
cli = CommandLineInterface.new

a = Artii::Base.new :font => "larry3d"
prompt = TTY::Prompt.new

puts a.asciify("Weekly")
puts a.asciify("Watcher")
cli.greet
# cli.greet
# cli.ask_what_day
puts cli.ask_how_to_search()

# puts cli.daily_results(cli.ask_what_day)
# puts cli.search_again


# toomany = cli.daily_timeslot(ask_what_day)

# 0
