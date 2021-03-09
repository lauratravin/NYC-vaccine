class Appointment < ActiveRecord::Base
    belongs_to :user
    has_many :appointment_locations, through: :appointment_location
    has_many :locations, through: :appointment_locations
end