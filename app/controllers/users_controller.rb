class UsersController < ApplicationController
	before_action :require_login, only: [:logout, :show]

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/songs"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/main"
		end
	end

	def show
		@user = current_user
		@playlist = @user.listeners
	end

	def login
		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
		if user
			session[:user_id] = user.id
			redirect_to "/songs"
		else
			flash[:errors] = ["Invalid Combination"]
			redirect_to "/main"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to "/main"
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
