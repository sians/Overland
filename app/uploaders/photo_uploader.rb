class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave # Include RMagick or MiniMagick support:
end
