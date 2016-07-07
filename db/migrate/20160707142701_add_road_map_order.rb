class AddRoadMapOrder < ActiveRecord::Migration
  def change
  	add_column :blog_posts, :road_map_order, :integer
  end
end
