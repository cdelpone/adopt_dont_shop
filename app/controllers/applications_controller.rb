class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @applications = Application.find(params[:id])
  end

  def create
    application = Application.create!(application_params)
  end

  def new

  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status)
  end
end
