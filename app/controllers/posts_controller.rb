class PostsController < ApplicationController
	# rails generated via $ rails g controller posts 

	def index # connected via the config/routes
		@posts = Post.all.order("created_at DESC")
	end

	def new # Makes a new form 
	end

	def create # Post route for Post
		@post = Post.new(post_params)
		@post.save

		redirect_to @post
	end 

	def show
		@post = Post.find(params[:id])
	end

	private 
	def post_params
		params.require(:post).permit(:title, :body)
	end 
end
