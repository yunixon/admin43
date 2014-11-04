require "babosa"

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: {sysadmin: 0, employer: 1, superadmin: 2}

  has_many :resumes, dependent: :destroy

  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id"

  validates :role, :name, presence: true
  validates :name, length: {minimum: 3, maximum: 80}
  validates :description, length: {maximum: 200}

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
