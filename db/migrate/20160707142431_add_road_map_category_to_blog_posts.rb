class AddRoadMapCategoryToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :road_map_category, :string
  end
end
