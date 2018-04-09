class AddShortDescriptionToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :short_description, :string
  end
end
