class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :application_pets, :application_status, :string
  end
end
