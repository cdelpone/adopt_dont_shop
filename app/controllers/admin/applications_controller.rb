class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    if params[:approve]
      application.update(application_params.merge({status: "Approved"}))
      # application_pets.update(params.merge({pet_status: "Approved"}))
      # application_pets.update(params.merge({application_status: "Approved"}))
    else params[:reject]
      application.update(application_params.merge({status: "Rejected"}))
      # application_pets.update(params.merge({pet_status: "Rejected"}))
      # application_pets.update(params.merge({application_status: "Rejected"}))
    end
      redirect_to admin_application_path(application.id)
  end

  private
  def app_pets_params
    params.permit(:application_id, :pet_id,)
  end

  def application_params
    params.permit(:id, :name, :street, :city, :state, :zip, :description, :status)
  end

  def pet_params
    params.permit(:id, :name, :age, :breed, :adoptable, :shelter_id)
  end
end
