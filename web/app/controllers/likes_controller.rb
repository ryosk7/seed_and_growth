class LikesController < ApplicationController

  before_action :set_post, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @posts = Post.all
    redirect_to post_path(@post)
  end

  def destroy
    like = current_user.likes.find_by(post_id: params[:post_id])
    like.destroy
    @posts = Post.all
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
