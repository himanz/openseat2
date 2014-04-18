class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

  validates :restaurant, :presence => true
	validate :availability

	private
	def availability
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "restaurant is full!")
		end
	end
end
