class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :following

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email ,
        password: Devise.friendly_token[0, 20]
      )
    end
    user.email = auth.info.email
    user.username = auth.info.name
    user.avatar = auth.info.image
    user
  end

  # ユーザーをフォローする
  def follow!(other_user)
   active_relationships.create(following_id: other_user.id)
  end

  # ユーザーをフォロー解除する
  def unfollow!(other_user)
   active_relationships.find_by(following_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
   following.include?(other_user)
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
