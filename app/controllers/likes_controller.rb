class LikesController < ApplicationController
  
  def create
    @likes = Like.all
    @user = current_user.id
    @post = params[:post_id]
    match = false
    @likes.each do |like|
      match = true if like.user_id == @user && like.post_id == @post.to_i
    end
    if match == false
      likes = {user_id: @user, post_id: @post}
      @like = Like.new(likes)

      @like.save!
    end
    redirect_to posts_url
  end
end
