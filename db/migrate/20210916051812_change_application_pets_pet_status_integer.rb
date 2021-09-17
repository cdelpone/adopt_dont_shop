class ChangeApplicationPetsPetStatusInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :application_pets, :pet_status, 'integer USING CAST(pet_status AS integer)'
  end
end
