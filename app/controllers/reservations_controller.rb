class ReservationsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, :only [:edit, :create, :show, :update, :destroy]

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @restaurant.reservations.build(reservation_params)		
		if @reservation.save
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
		params.require(:reservation).permit(:user_id, :restaurant_id, :party_size, :party_time, :party_date)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
