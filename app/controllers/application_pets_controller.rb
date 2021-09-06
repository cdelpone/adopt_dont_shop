class ApplicationPetsController < ApplicationController

  def create
    application_pets = ApplicationPet.create!(app_pets_params)
    if application_pets.save
      flash[:success] = "Pet added"
      redirect_to application_path(params[:application_id])
    else
      flash[:danger] = "Pet not added for x reason"
    end
  end

  private
  def app_pets_params
    params.permit(:application_id, :pet_id)
    # params.permit(application_id: "#{@application.id}", pet_id: "#{@pet.id}")
  end
end
