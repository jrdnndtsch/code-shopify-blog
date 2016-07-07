class BlogPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    if params[:author]
      @blog_posts = BlogPost.by_author(params[:author]).published?.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
    elsif params[:tag]
      @blog_posts = BlogPost.tagged_with(params[:tag]).published?.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
      # raise "hell"
    else
      @blog_posts = BlogPost.published?.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
    end
    @authors = User.all.includes(:blog_posts)
    @tags = ActsAsTaggableOn::Tag.all.where.not(taggings_count: 0).order(taggings_count: :desc)
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
    if user_owns_blog_post?
    else
      redirect_to root_path
    end
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user_id = current_user.id

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    @blog_post.user_id = current_user.id
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    if user_owns_blog_post?
      @blog_post.destroy
      respond_to do |format|
        format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.friendly.find(params[:id])
    end

    def user_owns_blog_post?
      @blog_post.user == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :tag_list, :published, :photo, :road_map_category, :road_map_order)
    end
end
