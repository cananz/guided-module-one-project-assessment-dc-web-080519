class Availableon < ActiveRecord::Base
  belongs_to :game
  belongs_to :system
end