class PostsController < ApplicationController
	def index
	  @posts = Post.all.order('created_at DESC')
	end

    # action when url is /posts/new/ -> redirect to posts/new.html.erb
	def new
	end

    def create
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
