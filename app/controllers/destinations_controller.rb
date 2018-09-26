class DestinationsController < ApplicationController
  before_action :set_destination

  # GET /destinations
  def index
    json_response(@destinations)
  end

  # GET /destinations/:id
  def show
    @destination = @destinations.find_by!(id: params[:id])
    json_response(@destination)
  end

  private

  def set_destination
    @destinations = Destination.all
  end
end
