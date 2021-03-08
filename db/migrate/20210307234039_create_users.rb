class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.text    :email
      t.text    :fullname
      t.text    :address
      t.string  :state
      t.date    :dob
      t.string   :level
      t.string  :password_digest
    end  
  end
end
