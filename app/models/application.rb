class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates_presence_of :name, :street, :city, :state, :zip

  # validates :name, presence: true
  # validates :street, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :zip, presence: true
end
