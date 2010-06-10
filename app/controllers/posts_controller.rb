class PostsController < ApplicationController
  def index
  	if params[:search].blank?
  		@posts = Post.find(:all)
  	else  			
  		
  	end
  	respond_to do |format|
  		format.html  { @posts = @posts.paginate(:page => params[:page], :per_page =>"2")}
  		format.rss
  	end
  end

  def archive
  end

  def edit
  	@post  = Post.find(params[:id])
  end

  def show
  	@post = Post.find(params[:id].to_i)
  	respond_to do |format|
        format.html
        format.rss
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
end