class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

  validates :restaurant, presence: true
	validate :availability
	validates :party_size, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	private
	def availability
		if !restaurant.availability(party_size, party_time)
			errors.add(:base, "restaurant is full!")
		end
	end
end
