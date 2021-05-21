class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    redirect_to posts_url
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def like
    @post = Post.find(params[:post_id])
    @post.likes += 1
    @post.save!
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
