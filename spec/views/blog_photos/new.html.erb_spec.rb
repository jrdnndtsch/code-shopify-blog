require 'rails_helper'

RSpec.describe "blog_photos/new", type: :view do
  before(:each) do
    assign(:blog_photo, BlogPhoto.new(
      :blog_post => nil
    ))
  end

  it "renders new blog_photo form" do
    render

    assert_select "form[action=?][method=?]", blog_photos_path, "post" do

      assert_select "input#blog_photo_blog_post_id[name=?]", "blog_photo[blog_post_id]"
    end
  end
end
