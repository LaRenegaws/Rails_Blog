class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page =>4) #orders posts by descending order
  end

  def new
  	@post = Post.new#
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  private

  def find_post
  	#finds correct ID for each post
  	@post = Post.friendly.find(params[:id])
  end

  def post_params
  	#permitting attributes that can be CUD to backend, title and body in this case
  	params.require(:post).permit(:title, :body)
  end
end
