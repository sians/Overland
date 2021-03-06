class JourneysController < ApplicationController
  before_action :fetch_journey, only: %i[show edit update destroy archive]

  def index
    @journeys = policy_scope(Journey).order(created_at: :desc)
  end

  def show
  end

  def new
    @journey = Journey.new
  end

  def create
    connection_service = CreateConnectionService.new
    @journey = connection_service.add_connections_to_journey(current_user.storage, current_user, params["connections"])
    authorize @journey
    redirect_to profile_path
  end

  def edit
  end

  def update
  end

  def destroy
    # @user.delete
  end

  def bookings
  end

  def archive
    @journey.archived = true
    @journey.save
    redirect_to profile_path
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
