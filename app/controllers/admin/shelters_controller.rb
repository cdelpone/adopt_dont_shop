class Admin::SheltersController < ApplicationController

  def index
    if params[:sort].present? && params[:sort] == "reverse alpha"
      @adminshelters = AdminShelter.reverse_order_by_name
    end
  end

  private

  def admin_shelter_params
    params.permit(:name)
  end
end
