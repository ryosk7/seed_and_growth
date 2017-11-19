class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render new_post_path
    end
  end

  def edit; end

  def update
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    if @post.save
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
        @post = Post.find_by(id: params[:id])
      end

      def post_params
        params.require(:post).permit(:content, :title)
      end
end
