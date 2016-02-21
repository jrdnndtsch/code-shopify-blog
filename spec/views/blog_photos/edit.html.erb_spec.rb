require 'rails_helper'

RSpec.describe "blog_photos/edit", type: :view do
  before(:each) do
    @blog_photo = assign(:blog_photo, BlogPhoto.create!(
      :blog_post => nil
    ))
  end

  it "renders the edit blog_photo form" do
    render

    assert_select "form[action=?][method=?]", blog_photo_path(@blog_photo), "post" do

      assert_select "input#blog_photo_blog_post_id[name=?]", "blog_photo[blog_post_id]"
    end
  end
end
