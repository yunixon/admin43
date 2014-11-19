require "babosa"

class Job < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  enum status: {unpublished: 0, published: 1}

  paginates_per 10

  belongs_to :employer, class_name: "User"
  #has_one :newsline, as: :element
  #has_one :newsline, through: :newsline_elements

  validates :name, :body, presence: true
  validates :name, length: {minimum: 3, maximum: 240}
  validates :body, length: {minimum: 3, maximum: 4000}
  validates_associated :employer

  def owner
    User.find_by id: employer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
  
end
