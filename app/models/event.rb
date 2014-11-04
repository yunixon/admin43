class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :organizers, class_name: "User"

end
