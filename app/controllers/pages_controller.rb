class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def journey_results
    @directions = GoogleDirectionsService.new

    current_user.storage = @directions.fetch_google_directions(params[:start_city], params[:end_city])
    current_user.save
  end
end
