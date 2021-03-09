class Location < ActiveRecord::Base
    has_many :appointment_locations
    has_many :appointments, through: :appointment_locations
    has_many :users, through: :appointments #not sure if this gonna work

 
end  