class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
  def new
  	@title = "Sign up"
  	@user = User.new
  end
  
  def show
	@user = User.find(params[:id])
	@title = @user.name
	@posts = @user.posts
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
  
  def edit
	@user = User.find(params[:id])
	@title = "Edit user"
  end
  
  def update
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		@title = "Edit user"
		render 'edit'
	end
  end

private
	def authenticate
		deny_access unless signed_in?
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end

end
