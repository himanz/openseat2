class ReservationsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		@reservation.user_id = @current_user.id
		if @reservation.party_size == nil
			redirect_to restaurant_url(@restaurant), :notice => "Please enter a number for capacity!"
		else		
			if @reservation.save
				redirect_to restaurants_path, notice: 'Reservation has been made'
			else
				redirect_to restaurant_path(@restaurant), notice: 'Restaurant is FULL, reservation not made for that time!'
			end
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :restaurant_id, :party_size, :party_time, :party_date)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
