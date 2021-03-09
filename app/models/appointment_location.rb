class AppointmentLocation < ActiveRecord::Base
    belongs_to :appointment
    belongs_to :location
   
end