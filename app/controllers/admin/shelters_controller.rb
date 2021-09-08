class Admin::SheltersController < ApplicationController

  def index
    @shelters = Shelter.reverse_order_by_name
    @shelter_ = Shelter.pending_apps
  end
end
