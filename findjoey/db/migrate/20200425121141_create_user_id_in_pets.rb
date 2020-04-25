class CreateUserIdInPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :users, foreign_key: { to_table: :users }
  end
end
