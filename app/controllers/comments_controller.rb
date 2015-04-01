class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
  end

	def create
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create!(params.require(:comment).permit!) 
 
    	respond_to do |format|
      		format.html { redirect_to @post }
      		format.js
      		format.atom
    	end
  	end
end
