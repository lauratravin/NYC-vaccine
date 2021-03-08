class CreateAppointmentLocation < ActiveRecord::Migration
  def change
        create_table :appointment_locations do |t|
          t.integer   :appointment_id
          t.integer   :location_id
        end
  end
end
