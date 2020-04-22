class ChangeColumnOwner < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :owner_id, :user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
