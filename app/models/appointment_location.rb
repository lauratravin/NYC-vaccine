class AppointmentLocation < ActiveRecord::Base
    belongs_to :appointments
    belongs_to :locations
   
end