class AddLongLatColums < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latitidue, :float
    add_column :users, :longitude, :float
  end
end
