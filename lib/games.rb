class Games < ActiveRecord::Base
    has_many :availableon
    has_many :system, through: :availableon
end