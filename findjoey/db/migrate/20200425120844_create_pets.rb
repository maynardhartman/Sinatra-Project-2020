class CreatePets < ActiveRecord::Migration[5.2]
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
      t.string :images
      
      t.timestamps
    end
  end
end
