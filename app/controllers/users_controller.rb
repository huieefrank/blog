class UsersController < ApplicationController
  def new
  	@title = "Sign up"
  	@user = User.new
  end
  
  def show
	@user = User.find(params[:id])
	@title = @user.name
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] ="Welcome to our blog !"
  		redirect_to root_path
  	else
  		@title = "sign up"
  		render "new"
  	end 
  end 		

end
