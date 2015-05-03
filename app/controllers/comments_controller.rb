class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
      if params[:product_id]
          @commentable = Product.find(params[:product_id])
      else params[:post_id]
        @commentable = Post.find(params[:post_id])
      end
      @comment = @commentable.comments.new(comment_params)
      @comment.user_id = current_user.id
      @comment.save

      respond_to do |format|
          format.html { redirect_to @commentable }
          format.js
          format.atom
      end
    end

     def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end