class Admin::ApplicationsController < ApplicationController

  def index
    @applications = Application.order_by_recently_created
  end

  def show
    @application = Application.find(params[:id])
  end

  def update
  # if all application pets are approved, then update application
  # if all application pets are rejected, then reject application
  end

  private
  #params I'm allowing through
  def app_pets_params
    params.permit(:id, :application_id, :pet_id, :pet_status)
  end
end
