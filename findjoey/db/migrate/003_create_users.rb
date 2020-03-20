class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :user do |t|
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
        t.timestamps null: false
      end
    end
  end