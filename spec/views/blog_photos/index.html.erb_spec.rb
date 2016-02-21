require 'rails_helper'

RSpec.describe "blog_photos/index", type: :view do
  before(:each) do
    assign(:blog_photos, [
      BlogPhoto.create!(
        :blog_post => nil
      ),
      BlogPhoto.create!(
        :blog_post => nil
      )
    ])
  end

  it "renders a list of blog_photos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
