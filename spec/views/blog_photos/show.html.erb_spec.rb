require 'rails_helper'

RSpec.describe "blog_photos/show", type: :view do
  before(:each) do
    @blog_photo = assign(:blog_photo, BlogPhoto.create!(
      :blog_post => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
