class AddRoadMapCategoryToBlogPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_posts, :road_map_category, :string
  end
end
