require 'bundler'
Bundler.require
ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

require 'artii'

# require "tty-prompt"

# prompt = TTY::Prompt.new

