class Restaurant < ActiveRecord::Base
	has_many :reservations

	def availability(party_size)
		party_size <= capacity
	end
end
