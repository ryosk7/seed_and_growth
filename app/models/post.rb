class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  validates :content, presence: true, length: { maximum: 185 }
  validates :title, presence: true, length: { maximum: 46 }
  validates :article, presence: true
end
