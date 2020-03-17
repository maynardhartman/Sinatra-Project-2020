# frozen_string_literal: true

require "active_record"

class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table pets do |p| (p.integer :id # system generated
      p.string :pet_name
      p.string :pet_breed
      p.string :pet_weight
      p.string :pet_temperament
      p.boolean :pet_chipped
      p.boolean :pet_collared
      p.string :chip_id
      p.string :pet_color
      p.datetime :pet_went_missing # the date and time pet went missing default: current datatime
      p.datetime :pet_date_found # the date and time pet was found if known defalut: current datetime
      timestamps)     end
  end
end
