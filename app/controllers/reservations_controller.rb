class ReservationsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		event = params[:reservation]
		@reservation.party_time = DateTime.new(event["party_date(1i)"].to_i,event["party_date(2i)"].to_i,event["party_date(3i)"].to_i,event["party_time(4i)"].to_i,00)

		if @reservation.party_size == nil
			redirect_to restaurant_url(@restaurant), :notice => "Please enter a number for capacity!"
		else		
			if @reservation.save
				redirect_to restaurant_path(@restaurant), notice: 'Reservation has been made'
			else
				render 'restaurants/show'
			end
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to user_path(current_user)
	end

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :restaurant_id, :party_size, :party_time, :party_date)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
