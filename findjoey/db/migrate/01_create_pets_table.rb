# frozen_string_literal: true

class CreatePetsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |p| (p.integer :id
      p.string :pet_name
      p.string :pet_breed
      p.integer :pet_weight
      p.string :pet_temperament
      p.boolean :pet_chipped
      p.boolean :pet_collared
      p.string :pet_chip_id
      p.string :pet_color
      p.datetime :pet_went_missing
      p.datetime :pet_date_found
      p.timestamps)     end
  end
end
