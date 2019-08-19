class System < ActiveRecord::Base
    has_many :availableon
    has_many :games, through: :availableon
end
