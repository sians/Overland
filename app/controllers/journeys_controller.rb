class UsersController < ApplicationController
  before_action :fetch_journey, only: %i[show new edit destroy]

  def show
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
  end

  def journey_params
    params.require(:journey).permit(name, start_city, end_city, archived)
  end


end




end

