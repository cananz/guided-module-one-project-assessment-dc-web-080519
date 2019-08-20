class User < ActiveRecord::Base
    has_many :showusers
    has_many :shows, through: :showusers

end
