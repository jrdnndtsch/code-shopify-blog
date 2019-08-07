class AddPhotoToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_attachment :blog_posts, :photo
  end
end
