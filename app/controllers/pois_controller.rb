class PoisController < ApplicationController

  def index
  end

  def create
    places_service = GooglePlacesService.new(params[:lat], params[:lng])
    redirect_to pois_index
  end
end
