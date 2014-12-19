class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  mount_uploader :name, ImageUploader

  validates_associated :imageable

end
