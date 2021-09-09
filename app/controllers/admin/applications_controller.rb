class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    require "pry"; binding.pry
    application_pets = ApplicationPet.find(params[:id])
    pet = Pet.find(params[:id])

    if params[:approve]
      application_pets.update(params.merge({pet_status: "Approved"}))
      application_pets.update(params.merge({application_status: "Approved"}))
      # application.update(application_params.merge({status: "Approved"}))
    else params[:reject]
      application_pets.update(params.merge({pet_status: "Rejected"}))
      application_pets.update(params.merge({application_status: "Rejected"}))
      # application.update(application_params.merge({status: "Rejected"}))
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
