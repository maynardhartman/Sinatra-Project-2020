class AddLongLatColums < ActiveRecord::Migration[5.2]
    def change
         
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)




    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
        t.string "user_fname"
        t.string "user_lname"
        t.string "addr_1"
        t.string "addr_2"
        t.string "city"
        t.string "state"
        t.string "user_zipcode"
        t.string "user_email"
        t.string "user_phone_1"
        t.string "user_phone_2"
        t.boolean "is_missing"
        t.boolean "account_verified"
        t.boolean "account_suspended"
        t.string "suspension_reason"
        t.string "password_digest"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.float "latitidue"
        t.float "longitude"
      end
    