class UsersController < ApplicationController
  before_action :fetch_journey, only: %i[show edit destroy]

  def index
    @journeys = current_user.journey.all
  end

  def show
    authorize @journey
  end

  def new
    @journey = Journey.new
    authorize @journey
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    authorize @journey
    #...
  end

  def edit
  end

  def update
  end

  def destroy
    # @user.delete
  end

  private

  def fetch_journey
    @journey = Journey.find(params[:id])
    authorize @journey
  end

  def journey_params
    params.require(:journey).permit(name, start_city, end_city, booking_status, archived)
  end
end
