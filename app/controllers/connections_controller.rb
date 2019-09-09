class ConnectionsController < ApplicationController
  before_action :fetch_connection, only: %i[index]

  def index
    @journey = Journey.find(params[:journey_id])
    @connections = @journey.connection.all
  end

  def new
    @journey = Journey.find(params[:journey_id])
    @connection = Connection.new
    authorize @connection
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @connection = Connection.new(connection_params)
    @connection.journey_id = @journey.id

    if @connection.save
      redirect_to @journey, notice: 'Added connection'
    else
      render :new
    end
  end

  end


  private

  def fetch_connection
    @connection = Connection.find(params[:journey_id])
    authorize @connection
  end

  def connection_params
    params.require(:connection).permit(start_city, end_city, booking_status)
  end


end
