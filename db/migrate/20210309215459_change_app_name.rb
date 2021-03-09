class ChangeAppName < ActiveRecord::Migration
  def change
    rename_column :appointments, :email, :dose
  end
end
