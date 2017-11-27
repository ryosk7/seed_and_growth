class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:info] = "編集しました！"
      redirect_to posts_path(@post)
    else
      flash[:wanding] = "失敗しました。 もう一度投稿内容を確認してください..."
      render edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    flash[:info] = "投稿を削除しました！"
    redirect_to posts_path
  end

  private

      def set_post
        @post = current_user.posts.find_by(id: params[:id])
      end

      def post_params
        params.require(:post).permit(:content, :title, :picture, :article, :first_url, :user_id)
      end
end
