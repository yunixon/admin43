require "babosa"
require 'carrierwave/orm/activerecord'

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  mount_uploader :logo, ImageUploader

  paginates_per 10

  belongs_to :organizer, class_name: "User"

  has_many :event_attendances
  has_many :users, through: :event_attendances

  validates :title, :start_date, :end_date, :location, :agenda, :address, presence: true
  validates :title, :location, :address, length: {minimum: 3, maximum: 240}
  validates :agenda, length: {minimum: 3, maximum: 4000}
  validates_associated :organizer

  def owner
    User.find_by id: organizer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
