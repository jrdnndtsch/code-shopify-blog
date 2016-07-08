class AddMetaDescriptionToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :meta_description, :string
  end
end
