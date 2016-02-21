class DropBlogPhotosTable < ActiveRecord::Migration
  def change
    drop_table :blog_photos
  end
end
