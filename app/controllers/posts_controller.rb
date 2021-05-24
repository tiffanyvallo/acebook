class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    p post_params["image"]
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def like
    @post = Post.find(params[:post_id])
    @post.likes += 1
    @post.save!
    redirect_to posts_url
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
