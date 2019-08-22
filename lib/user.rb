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
    
    def self.username_exists(name_string)
        if self.all.find {|user_obj| 
            # binding.pry
            user_obj.name.downcase == name_string.downcase}
            true
        else
            false
        end
    end
end
