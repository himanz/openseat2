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
      redirect_to new_user_url
    end
	end

	def edit
	end

	def update
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
