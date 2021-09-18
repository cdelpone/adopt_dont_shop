class ApplicationPetsController < ApplicationController

  def create
    application_pets = ApplicationPet.create!(app_pets_params)
    if application_pets.save
      flash[:success] = "Pet successfully added to your application!"
      redirect_to application_path(params[:application_id])
    else
      flash[:danger] = "Pet not added for x reason"
    end
  end

  def update
  end

  private
  def app_pets_params
    params.permit(:id, :application_id, :pet_id, :pet_status)
  end
end
