class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {sysadmin: 0, employer: 1, superadmin: 2}

  validates :role, :name, presence: true
  validates :name, length: {minimum: 3, maximum: 80}
  validates :description, length: {maximum: 200}

end
