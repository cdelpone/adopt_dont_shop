class Admin::ApplicationPetsController < ApplicationController

  def update
    application = Application.find(params[:id])
    pet = Pet.find(params[:pet_id])
    application_pet = ApplicationPet.find_by(application: application, pet: pet)
    if params[:pet_status].present?
      application_pet.update(pet_status: params[:pet_status])
      flash[:success] = "Pet status successfully updated!"
      redirect_to admin_application_path(application.id)
    else
      flash[:alert] = "Pet status not updated"
      redirect_to admin_application_path(application.id)
    end
  end

  private
  def app_pets_params
    params.permit(:id, :application_id, :pet_id, :pet_status)
  end
end
