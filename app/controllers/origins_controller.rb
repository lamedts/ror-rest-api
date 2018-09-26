class OriginsController < ApplicationController
  before_action :set_origin
  
  # GET /origins
  def index
    json_response(@origins)
  end

  # GET /origins/:id
  def show
    @origin = @origins.find_by!(id: params[:id])
    json_response(@origin)
  end

  private

  def set_origin
    @origins = Origin.all
  end
end
