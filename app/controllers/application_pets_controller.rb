class ApplicationPetsController < ApplicationController

  def create
    application_pets = ApplicationPet.create!(app_pets_params)
    require "pry"; binding.pry
    if application_pets.save
      flash[:success] = "Pet added"
    else
      flash[:danger] = "Pet not added for x reason"
    end
    redirect_to application_path(params[:application_id])
  end

  private
  def app_pets_params
    params.permit(:application, :pet)
  end
end
