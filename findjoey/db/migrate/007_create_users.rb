class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_fname
      t.string :user_lname
      t.string :addr_1
      t.string :addr_2
      t.string :city
      t.string :state
      t.string :user_zipcode
      t.string :user_email
      t.string :user_phone_1
      t.string :user_phone_2
      t.boolean :is_missing  # flag is user has a missing animal
      t.boolean :account_verified # gets set (true) when user verifies identity via email etc
      t.boolean :account_suspended # if suspended for what ever reason
      t.timestamps null: false
    end
  end
end
