class PostsController < ApplicationController
	before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
  	if params[:search].blank?
  		@posts = Post.published.recent
  	else  			
  		
  	end
  	respond_to do |format|
  		format.html  { @posts = @posts.paginate(:page => params[:page], :per_page =>"2")}
  		format.rss
  	end
  end

  def archive
  	posts = Post.published.recent
  	@posts_months = posts.group_by(&:published_month)
  end

  def edit
  	@post  = Post.find(params[:id])
  end

  def show
  	 
  	if Post.find_by_id(params[:id].to_i).nil?
  		headers["Status"] = "301 Moved Permanently"
        redirect_to root_path
	else
		@post = Post.find(params[:id].to_i)
		@comment = Comment.new(:post => @post)
  	    respond_to do |format|
  	    	format.html
  	    	format.rss 
  	    end   
    end
  end

  def new
  	@post =Post.new
  end
  
  def create
  	@post = Post.new(params[:post])
  	if @post.save
  		flash[:notice] = "Successfully created post."
        redirect_to @post
    else
    	render 'new'
    end  	
  end
  
  def update
  	@post  = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
  		flash[:notice] = "Successfully updated post."
        redirect_to @post
  	else
  		render 'edit'	
  	end
  end
  
  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_path  	
  end
  
  private
	def authenticate
		deny_access unless signed_in?
	end
end