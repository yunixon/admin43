require "babosa"

class Newsline < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  enum status: {unpublished: 0, published: 1}

  paginates_per 10

  #has_many :newsline_elements, dependent: :destroy

  #has_many :events, through: :newsline_elements, source: :element, source_type: 'Event'
  #has_many :jobs, through: :newsline_elements, source: :element, source_type: 'Job'

  validates :name, :body, presence: true
  validates :name, length: {minimum: 3, maximum: 240}
  validates :body, length: {minimum: 3, maximum: 4000}

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
