class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
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
    params.require(:post).permit(:message, :photo1, :photo2, :photo3, :photo4)
  end
end
