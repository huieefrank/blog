class TagsController < ApplicationController
  def show
  	@tag = Tag.find(params[:id])
    @posts = @tag.posts.published.recent.paginate(:page => params[:page], :per_page => 2, :count => { :select => "*" })
  end

end
