class CommentsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end

  def index
    @comments = Comment.all
  end

  def create
      # @user = User.find(params[:user_id])
      @product = Product.find(params[:product_id])
      @comment = @product.comments.create!(comment_params) 
      @comment.user_id = current_user.id
      @comment.save

      respond_to do |format|
          format.html { redirect_to @product }
          format.js
          format.atom
      end
    end

     def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end