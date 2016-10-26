class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def about
  end
  def roadmap
  	@theme_posts = BlogPost.published?.by_category('Theme').order(:road_map_order)
  	@app_posts = BlogPost.published?.by_category('App').order(:road_map_order)
  	# fresh_when etag: @theme_posts, last_modified: @theme_posts.maximum(:updated_at), public: true
  	# fresh_when etag: @app_posts, last_modified: @app_posts.maximum(:updated_at), public: true
  end
end
