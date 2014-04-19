class User < ActiveRecord::Base
	has_many :reservations

  validates :name, :email, :presence => true
  validates :email, uniqueness: true
	has_secure_password
end
