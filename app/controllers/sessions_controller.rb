class SessionsController < Devise::SessionsController
  def new
    session[:start_city] = params[:start_city]
    session[:end_city] = params[:end_city]
    super
  end

  def create
    super
  end
end
