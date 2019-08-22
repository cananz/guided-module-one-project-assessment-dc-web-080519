require 'pry'
class User < ActiveRecord::Base
    has_many :show_users
    has_many :shows, through: :show_users
    
    def self.names
        self.all.map {|person| person.name.capitalize}
    end

    def shows
        mine = ShowUser.all.select {|x| x.user == self}
        mine.map {|z| z.show}
        #write a method in shows #titles that takes in array of shows and returns just the titles
    end
    
end
