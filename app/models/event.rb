require "babosa"
require 'carrierwave/orm/activerecord'

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :organizers, class_name: "User"
  #has_one :newsline, as: :element
  #has_one :newsline, through: :newsline_elements

  mount_uploader :logo, ImageUploader

  paginates_per 10

  def owner
    User.find_by id: organizer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
