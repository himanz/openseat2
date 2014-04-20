class User < ActiveRecord::Base
	has_many :reservations
	has_many :restaurants

  validates :name, :email, :presence => true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
	has_secure_password
end
