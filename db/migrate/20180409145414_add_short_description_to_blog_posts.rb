class AddShortDescriptionToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :short_description, :string
  end
end
