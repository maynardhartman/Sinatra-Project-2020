     class RebuildTheTablePets < ActiveRecord::Migration[5.2]
       def change
          drop_table :pets
          create_table :pets do |t|
            t.string :name
            t.string :breed 
            t.integer :weight
            t.string :temperament
            t.boolean :chipped
            t.string :chip_id
            t.boolean :collared
            t.string :color
            t.datetime :went_missing
            t.datetime :date_found
            t.string :image
            t.bigint :users_id
            t.timestamps
            foreign_key
          end
          drop_table :users
          create_table :users do |t|
            t.string "fname"
            t.string "lname"
            t.string "addr_1"
            t.string "addr_2"
            t.string "city"
            t.string "state"
            t.string "zipcode"
            t.string "email"
            t.string "phone_1"
            t.string "phone_2"
            t.boolean "is_missing"
            t.boolean "account_verified"
            t.boolean "account_suspended"
            t.string "suspension_reason"
            t.string "password_digest"
            t.float "longitude"
            t.float "latitude"
            
            t.timestamps  
          end
        end
      end
