# frozen_string_literal: true

class CreatePetsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :weight
      t.string :pet_temperament
      t.boolean :pet_chiped
      t.string :pet_chip_id
      t.boolean :pet_collared
      t.string :pet_color
      t.datetime :pet_went_missing
      t.datetime :date_found
      t.string :pet_images

      t.timestamps
    end
    add_index :pet_chip_id
  end
end
