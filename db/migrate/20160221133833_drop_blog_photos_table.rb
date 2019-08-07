class DropBlogPhotosTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :blog_photos
  end
end
