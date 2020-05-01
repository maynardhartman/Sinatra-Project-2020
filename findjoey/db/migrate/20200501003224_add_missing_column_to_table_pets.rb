     class AddMissingColumnToTablePets < ActiveRecord::Migration[5.2]
       def change
          add_column :pets, :is_missing, :integer 
       end
     end
