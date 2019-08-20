require_relative '../config/environment'
cli = CommandLineInterface.new

a = Artii::Base.new
puts a.asciify('unnamed TV app')
cli.greet
# cli.ask_what_day
cli.show_results
