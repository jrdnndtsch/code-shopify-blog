class AddPublishToBlogPost < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :published, :boolean, default: false
  end
end
