require "rails_helper"

RSpec.describe BlogPhotosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blog_photos").to route_to("blog_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/blog_photos/new").to route_to("blog_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/blog_photos/1").to route_to("blog_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blog_photos/1/edit").to route_to("blog_photos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blog_photos").to route_to("blog_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/blog_photos/1").to route_to("blog_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/blog_photos/1").to route_to("blog_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blog_photos/1").to route_to("blog_photos#destroy", :id => "1")
    end

  end
end
