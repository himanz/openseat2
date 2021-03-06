class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

  validates :restaurant, presence: true
	validate :availability
	validates :party_size, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

	private
	def availability
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "Restaurant is full, pick another reservation time or date!")
		end
	end
end
