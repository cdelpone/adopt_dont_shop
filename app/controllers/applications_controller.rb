class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def create
    application = Application.create(application_params)
    if application.valid?
      redirect_to application_path(application.id)
    else
      flash[:danger] = 'Incomplete form, please complete required fields'
      redirect_to new_application_path
    end
  end

  def new
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status)
  end

  def incomplete_error
    # flash[:incomplete_error] = 'Incomplete form, please complete required fields'
    puts 'Incomplete form, please complete required fields'
  end
end
