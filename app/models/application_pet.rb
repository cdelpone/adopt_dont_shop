class ApplicationPet < ApplicationRecord
  after_update :update_relationships

  belongs_to :pet
  belongs_to :application

  validates_presence_of :application_id, :pet_id

  enum status: %w(rejected approved)

  def update_relationships
    # call method on application - change application status
    # call method on pet - make pet unadoptable
  end
end
