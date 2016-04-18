class User < ActiveRecord::Base
  validates_presence_of :email_address, :password
  validates :email_address, uniqueness: true
  validates_confirmation_of :password
  has_secure_password

  has_many :links
end
