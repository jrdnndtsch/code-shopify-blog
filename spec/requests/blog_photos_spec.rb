require 'rails_helper'

RSpec.describe "BlogPhotos", type: :request do
  describe "GET /blog_photos" do
    it "works! (now write some real specs)" do
      get blog_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
