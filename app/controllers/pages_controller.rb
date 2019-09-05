class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
  end

  def connections
    @directions = GoogleDirectionsService.new
  end

  def journey_results
    @directions = GoogleDirectionsService.new

    start_at_date = params[:starts_at].empty? ? Date.today : Date.parse(params[:starts_at])

    if params[:start_city].empty? || params[:end_city].empty?
      redirect_to root_path, alert: "Provide Cities"
    else
      current_user.storage = @directions.fetch_google_directions(params[:start_city], params[:end_city])
      current_user.save
    end
  end
end
