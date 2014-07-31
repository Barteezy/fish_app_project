class User < ActiveRecord::Base

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  has_secure_password

end