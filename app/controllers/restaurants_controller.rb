class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]

	def index
		@restaurants = if params[:search]
			Restaurant.where("lower(name) like ?", "%#{params[:search]}%")
		else
			Restaurant.all
		end
	end

  def search
  	@restaurants = Restaurant.where("lower(name) like ?", "%#{params[:search]}%")
  	render @restaurants
  end

	def show
		@restaurant = Restaurant.find(params[:id])

		@reservation = @restaurant.reservations.build
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_path
		else
			render "new"
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			redirect_to restaurant_url(@restaurant)
		end
	end

	def destroy
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :capacity, :start_res, :end_res, :user_id, :address)
	end
end
