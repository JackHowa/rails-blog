class PostsController < ApplicationController
	# rails generated via $ rails g controller posts 

	def index # connected via the config/routes
		@posts = Post.all.order("created_at DESC")
	end

	def new # Makes a new form 
		@post = Post.new
	end

	def create # Post route for Post
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new' # redirect would lose the flash error message
		end
	end 

	def show
		@post = Post.find(params[:id])
	end

	private 
	def post_params
		params.require(:post).permit(:title, :body)
	end 
end
