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

  validates :title, :start_date, :end_date, :location, :agenda, :address, presence: true
  validates :title, :location, :address, length: {minimum: 3, maximum: 140}
  validates :agenda, length: {minimum: 3, maximum: 2000}
  validates_associated :organizers

  def owner
    User.find_by id: organizer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
