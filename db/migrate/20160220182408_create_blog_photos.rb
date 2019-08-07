class CreateBlogPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_photos do |t|
      t.references :blog_post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
