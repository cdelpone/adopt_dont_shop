class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params[:search].present?
      @pets = Pet.search(params[:search])
    end
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to application_path(application.id)
    else
      flash[:danger] = 'Incomplete form, please complete required fields'
      redirect_to new_application_path
    end
  end

  def update
    if !params[:description].blank?
      application.update(application_params.merge({status: "Pending"}))
      redirect_to new_application_path
    else
      flash[:alert] = 'Must provide a description'
    end
      redirect_to application_path(application.id)
  end

  def new
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status)
  end
end
