class Posts::LikesController < ApplicationController
  before_action :set_post

  def create
    @post.likes.where(user_id: current_user.id).first_or_create

    respond_to do |f|
      f.html { redirect_to @post }
      f.js
    end
  end

  def destroy
    @post.likes.where(user_id: current_user.id).destroy_all
    respond_to do |f|
      f.html { redirect_to @post }
      f.js
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
