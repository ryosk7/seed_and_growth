class AddFirstViewToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :first_url, :text
  end
end
