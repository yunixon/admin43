class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  validates_associated :imageable

end
