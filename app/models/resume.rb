require "babosa"

class Resume < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  before_create :set_status
  before_update :set_status

  paginates_per 10

  belongs_to :user
  
  validates :name, :body, :status, presence: true
  validates :name, length: {minimum: 3, maximum: 240}
  validates :body, length: {minimum: 3, maximum: 4000}
  validates_associated :user

  scope :published, -> { where(status: 'published') }
  scope :unpublished, -> { where(status: 'unpublished') }

  include Workflow

  workflow_column :status

  workflow do
    state :unpublished do
      event :publicate, transitions_to: :published
    end
    state :published do
      event :rewrite, transitions_to: :unpublished
    end
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  private

  def set_status
    self.status = 'unpublished'
  end

end
