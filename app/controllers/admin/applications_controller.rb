class Admin::ApplicationsController < ApplicationController

  def index
    @applications = Application.order_by_recently_created
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    # or app_pet_params
    pet = Pet.find(params[:pet_id])
    application_pet = ApplicationPet.find_by(application: application, pet: pet)
    if params[:pet_status].present?
      application_pet.update(pet_status: params[:pet_status])
    end
      redirect_to admin_application_path(application.id)
  end

  private
  #params I'm allowing through
  def app_pets_params
    params.permit(:id, :application_id, :pet_id, :pet_status)
  end
  #
  # def application_params
  #   params.permit(:id, :name, :street, :city, :state, :zip, :description, :status)
  # end
  #
  # def pet_params
  #   params.permit(:id, :name, :adoptable, :shelter_id)
  # end
end
