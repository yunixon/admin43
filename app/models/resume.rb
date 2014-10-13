class Resume < ActiveRecord::Base
  enum status: {unpublished: 0, published: 1}

  belongs_to :user
  
  validates :body, presence: true
  validates :body, length: {minimum: 3, maximum: 400}

  validates_associated :user

end
