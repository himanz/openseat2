require 'spec_helper'

describe Restaurant do
  let(:restaurant) { Restaurant.new(name: 'Guu', capacity: 100)}

  it 'should return true when party size is less than capacity' do
  	expect(restaurant.availability(25)).to be true
  end

  it 'should return false when party size is greater than capacity' do
  	expect(restaurant.availability(101)).to be false
  end

  it 'should return true when reservations plus party size fits' do
  	res = Reservation.new(restaurant: restaurant, party_size: 10)
  end

end
