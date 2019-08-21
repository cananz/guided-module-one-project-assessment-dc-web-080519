class User < ActiveRecord::Base
    has_many :show_users
    has_many :shows, through: :show_users
    
    def self.names
        self.all.map {|person| person.name}
    end
end
