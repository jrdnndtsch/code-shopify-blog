class AddPhotoToBlogPosts < ActiveRecord::Migration
  def change
    add_attachment :blog_posts, :photo
  end
end
