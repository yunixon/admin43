# encoding: utf-8
class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave

  # Include RMagick or ImageScience support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  #storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  [:extract_content_type, :set_size, :read_dimensions].each do |method|
    define_method :"#{method}_with_cloudinary" do
      send(:"#{method}_without_cloudinary") if self.file.is_a?(CarrierWave::SanitizedFile)
      {}
    end
    alias_method_chain method, :cloudinary
  end

  process :read_dimensions

  # Create different versions of your uploaded files:
  version :thumbnail do
    process resize_to_fill: [275, 206]
  end

  # crop to 62px, 62px
  version :mini_thumbnail do
    process resize_to_fill: [62, 62]
  end

  # crop to 870px, 261px
  version :detail do
    process resize_to_fill: [870, 261]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.image_file_types
  end
end
