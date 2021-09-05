class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def create
    application = Application.create!(application_params)
    redirect_to application_path(application.id)
  end

  def new
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status)
  end
end
