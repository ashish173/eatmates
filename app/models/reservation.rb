class Reservation < ActiveRecord::Base

  belongs_to :user

  validates_presence_of  :restaurant_name, :place, :time_of_reservation
end
