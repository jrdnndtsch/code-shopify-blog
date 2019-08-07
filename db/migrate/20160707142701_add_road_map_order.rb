class AddRoadMapOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :blog_posts, :road_map_order, :integer
  end
end
