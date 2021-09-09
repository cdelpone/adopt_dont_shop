class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    if params[:approve]
      application.update(application_params.merge({status: "Approved"}))
    else params[:reject]
      application.update(application_params.merge({status: "Rejected"}))
    end
      redirect_to admin_application_path(application.id)
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status)
  end
end
