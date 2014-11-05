require "babosa"

class Job < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  enum status: {unpublished: 0, published: 1}

  paginates_per 10

  belongs_to :employers, class_name: "User"

  def owner
    User.find_by id: employer_id
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
  
end
