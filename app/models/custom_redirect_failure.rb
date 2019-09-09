class CustomRedirectFailure < Devise::FailureApp
  def redirect_url
    new_user_session_url(start_city: params[:start_city], end_city: params[:end_city])
  end
end
