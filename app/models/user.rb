require 'babosa'

class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  include TheComments::User

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :linkedin]

  enum role: { unsetuped: -1, sysadmin: 0, employer: 1, superadmin: 2 }

  mount_uploader :photo, ImageUploader

  paginates_per 10

  has_many :resumes, dependent: :destroy
  has_many :jobs, class_name: 'Job', foreign_key: 'employer_id', dependent: :destroy
  has_many :organized_events, class_name: 'Event', foreign_key: 'organizer_id', dependent: :destroy

  has_many :event_attendances, dependent: :destroy
  has_many :events, through: :event_attendances, dependent: :destroy

  has_many :identities, dependent: :destroy

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update
  validates :role, presence: true
  validates :name, length: {minimum: 3, maximum: 120}
  validates :description, length: { maximum: 4000 }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user
    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      # email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email # if email_is_verified
      # puts "!!!AUTH!!! " + auth.to_s
      user = User.where(email: email).first if email
      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          # : auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0, 20],
          role: :unsetuped
        )
        user.skip_confirmation! # if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  def comments_admin?
    self.superadmin?
  end

  def comments_moderator? comment
    id == comment.holder_id
  end
end
