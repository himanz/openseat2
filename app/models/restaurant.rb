class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, :through => :reservations

	def availability(party_size, party_time)
		reserve_size = reservations.where(party_time: party_time).sum(:party_size)
		reserve_size + party_size <= capacity
	end
end
