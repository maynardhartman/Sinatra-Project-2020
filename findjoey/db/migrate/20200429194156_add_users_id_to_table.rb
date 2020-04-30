class AddUsersIdToTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :user_id
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
