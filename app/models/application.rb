class Application < ApplicationRecord
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets, dependent: :destroy

  validates_presence_of :name, :street, :city, :state, :zip
end
