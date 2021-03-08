class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date  :date
      t.time :time
      t.text    :email
      t.integer  :user_id
    end
       
  end
end
