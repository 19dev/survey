# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]          
  end
  
  version :thumbnail do
    eager
    resize_to_fit(350, 550)
  end


end
