class ChangeColumnUsersIdToUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :user_id
    add_column :pets, :users_id, :bigint
  end
end
