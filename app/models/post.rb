class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 185 }
  validates :title, presence: true, length: { maximum: 46 }
end
