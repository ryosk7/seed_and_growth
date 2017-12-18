module PostsHelper
  def liked_user
    Like.find_by(id: params[:user_id]) do |user|
      User.find_by(id: params[:user]).each do |keeper|
        keeper.avatar
      end
    end
  end
end
