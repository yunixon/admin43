class Newsline < ActiveRecord::Base

  paginates_per 10

  has_many :newsline_elements

  has_many :events, through: :newsline_elements, source: :element, source_type: 'Event'
  has_many :jobs, through: :newsline_elements, source: :element, source_type: 'Job'

end
