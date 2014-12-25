require 'babosa'

class Job < ActiveRecord::Base
  include TheComments::Commentable
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  before_create :set_status
  #before_update :set_status

  paginates_per 10

  belongs_to :employer, class_name: 'User'

  validates :name, :body, presence: true
  validates :name, length: { minimum: 3, maximum: 240 }
  validates :body, length: { minimum: 3, maximum: 4000 }
  validates_associated :employer

  scope :moderating, -> { where(status: 'moderating') }
  scope :accepted,   -> { where(status: 'accepted') }
  scope :rejected,   -> { where(status: 'rejected') }
  scope :completed,  -> { where(status: 'complete') }

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
    state :accepted do
      event :complete, transitions_to: :completed
    end
    state :rejected do
      event :rewrite, transitions_to: :new
    end
    state :completed
  end

  def owner
    User.find_by id: employer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def commentable_title
    try(:name) || 'Загаловок не задан'
  end

  def commentable_url
    ['', self.class.to_s.tableize, id].join('/')
  end

  def commentable_state
    try(:status) || 'published'
  end

  private

  def set_status
    self.status = 'new'
  end
end
