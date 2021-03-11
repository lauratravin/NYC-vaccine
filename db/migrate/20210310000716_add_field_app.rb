class AddFieldApp < ActiveRecord::Migration
  def change

    add_column :appointments, :location_id, :integer

  end
end
