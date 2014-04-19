class ReservationsController < ApplicationController
	before_filter :load_restaurant

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		if @reservation.save
			event = params[:reservation]
			year = event["party_time(1i)"].to_i
			month = event["party_time(2i)"].to_i
			day = event["party_time(3i)"].to_i 
			redirect_to restaurants_path, notice: 'Reservation has been made'
		else
			render :action => :show
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :restaurant_id, :party_size, :party_time)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
