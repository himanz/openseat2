require 'spec_helper'

describe Restaurant do
  let(:restaurant) { Restaurant.new(name: 'Guu', capacity: 100)}

  it 'should return true when party size is less than capacity' do
  	expect(restaurant.availability(25, nil)).to be true
  end

  it 'should return false when party size is greater than capacity' do
  	expect(restaurant.availability(101, nil)).to be false
  end

  it 'should return false when reservations plus party size does not fit' do
  	res = Reservation.create(restaurant: restaurant, party_size: 10)
  	expect(restaurant.availability(91, nil)).to be false
  end

  it 'should return true when restaurant empty at 7pm' do
  	party_time = DateTime.new(2014,4,18,18,00)
  	res = Reservation.create(restaurant: restaurant, party_size: 100, party_time: party_time)

  	t = DateTime.new(2014,4,18,19,00)
  	expect(restaurant.availability(10,t)).to be true
  end

end
