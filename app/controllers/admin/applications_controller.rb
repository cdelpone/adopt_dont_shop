class Admin::ApplicationsController < ApplicationController

  def index
    @applications = Application.order_by_recently_created
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    pet = Pet.find(params[:pet_id])
    application_pet = ApplicationPet.find(params[:id])
    if params[:approve]
      application_pet.update(params.merge({pet_status: "Approved"}))
    # else params[:reject]
    #   application_pet.update(params.merge({pet_status: "Rejected"}))
    #   application.update(application_params.merge({status: "Rejected"}))
    end
      redirect_to admin_application_path(application.id)
  end

  private
  def app_pets_params
    params.permit(:id, :application_id, :pet_id, :pet_status)
  end

  def application_params
    params.permit(:id, :name, :street, :city, :state, :zip, :description, :status)
  end

  def pet_params
    params.permit(:id, :name, :adoptable, :shelter_id)
  end
end
