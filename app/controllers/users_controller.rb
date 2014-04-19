class UsersController < ApplicationController
	def show

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to restaurants_url, :notice => "Signed up!"
		else
      render :new
    end
	end

	def edit
	end

	def update
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
