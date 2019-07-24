class AddArticleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :article, :text
  end
end
