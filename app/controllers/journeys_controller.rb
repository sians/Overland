class UsersController < ApplicationController
  before_action :fetch_journey, only: %i[show edit update destroy]

  def index
    @journeys = policy_scope(Journey).order(created_at: :desc)
  end

  def show
    authorize @journey
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)

    @journey.user = current_user
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
