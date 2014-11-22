require "babosa"
require 'carrierwave/orm/activerecord'

class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  before_create :set_status
  before_update :set_status

  mount_uploader :logo, ImageUploader

  paginates_per 10

  belongs_to :organizer, class_name: "User"

  has_many :event_attendances, dependent: :destroy
  has_many :users, through: :event_attendances, dependent: :destroy

  validates :title, :start_date, :end_date, :location, :agenda, :address, presence: true
  validates :title, :location, :address, length: {minimum: 3, maximum: 240}
  validates :agenda, length: {minimum: 3, maximum: 4000}
  validates_associated :organizer

  scope :moderating, -> { where(status: 'moderating') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :rejected, -> { where(status: 'rejected') }

  include Workflow

  workflow_column :status

  workflow do
    state :new do
      event :submit, transitions_to: :moderating
    end
    state :moderating do
      event :accept, transitions_to: :accepted
      event :reject, transitions_to: :rejected
    end
    state :accepted
    state :rejected do
      event :rewrite, transitions_to: :new
    end
  end


  def owner
    User.find_by id: organizer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def joined
    self.event_attendances.count
  end

  private

  def set_status
    self.status = 'new'
  end

end
