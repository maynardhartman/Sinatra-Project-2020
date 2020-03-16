# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[5.2]



  def Pets



    create_table pets do |p| (



      p.integer   :id           #system generated



      p.string    :pet_name



      p.string    :pet_breed 



      p.integer   :pet_weight



      p.string    :pet_temperament



      p.boolean   :pet_chipped,  default: true



      p.boolean   :pet_collared, default: true



      p.string    :chip_id



      p.string    :pet_color



      p.datetime  :pet_went_missing, default: datetime.now()  # the date and time pet went missing default: current datatime



      p.datetime  :pet_date_found, defaullt: datetime.new()   # the date and time pet was found if known defalut: current datetime



      p.timestamps 



    ) 



  end



end



