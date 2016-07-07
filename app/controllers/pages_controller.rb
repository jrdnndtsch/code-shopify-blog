class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def about
  end
  def roadmap
  	@theme_posts = BlogPost.published?.by_category('Theme').order(:road_map_order)
  	@app_posts = BlogPost.published?.by_category('App').order(:road_map_order)
  end
end
