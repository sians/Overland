module UserHelper
  def photo_or_placeholder(user)
    if user.avatar_url.present?
      cl_image_path user.avatar_url
    else
      # asset_url ''
      'https://www.theflavorbender.com/wp-content/uploads/2017/07/Magical-Color-Changing-Cocktails-The-Flavor-Bender-8.jpg'
    end
  end
end
