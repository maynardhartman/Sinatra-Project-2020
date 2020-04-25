class CreateUsersWithPassword < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :addr_1
      t.string :addr_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email
      t.string :phone_1
      t.string :phone_2
      t.boolean :is_missing  # flag is user has a missing animal
      t.boolean :account_verified # gets set (true) when user verifies identity via email etc
      t.boolean :account_suspended # if suspended for what ever reason
      t.string :suspension_reason # why suspended
      t.string :password_digest # salted and hashed passworn
      t.float :longitude #longitude of user
      t.float :latitude  #latitude of user
      t.timestamps null: false
    end
  end
end
