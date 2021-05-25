class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
    @likes = Like.all
  end

  def show
    redirect_to posts_url
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def like
    Like.create
    redirect_to posts_url #change to root 
  end

  # def update
  #   @post = Post.find(params[:post_id])
  #   @post.image <<
  #   redirect_to posts_url
  #   # respond_to do |format|
  #   #   if @post.update(post_params)
  #   #     format.html { redirect_to @post, notice: "Post was successfully updated." }
  #   #     format.json { render :show, status: :ok, location: @post }
  #   #   else
  #   #     format.html { render :edit, status: :unprocessable_entity }
  #   #     format.json { render json: @post.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

  private

  def post_params
    params.require(:post).permit(:message, image: [])
  end
end
