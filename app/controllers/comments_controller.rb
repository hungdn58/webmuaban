class CommentsController < ApplicationController
	 before_filter :authorize
  	def new
    	@post = Post.find(params[:post_id])
  	end

	def create
		@user = User.find(session[:user_id])
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create!(params.require(:comment).permit!) 

    	respond_to do |format|
      		format.html { redirect_to @post }
      		format.js
      		format.atom
    	end
  	end
end
