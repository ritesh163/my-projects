class CommentsController < ApplicationController

	def index
	end

	def new
		@post=Post.find(params[:post_id])
		@comment=Comment.new
	end

	def create
		@post=Post.find(params[:post_id])
		@comment=@post.comments.new(comment_params)
		@comment.save
		redirect_to posts_path, notice: 'Image  was successfully uploaded.' 
	end

	private
	def comment_params
		params.require(:comment).permit(:id, :c_body, :post_id)
	end
end
