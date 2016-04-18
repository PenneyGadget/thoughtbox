class User < ActiveRecord::Base
  has_secure_password
  validates_confirmation_of :password
  validates :email_address, presence: true, uniqueness: true

  has_many :links
end
