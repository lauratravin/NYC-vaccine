class Appointment < ActiveRecord::Base
    belongs_to :users
    has_many :appointment_locations, through: :appointment_locations
    has_many :locations, through: :appointment_locations
end