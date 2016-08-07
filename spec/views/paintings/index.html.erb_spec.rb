require 'rails_helper'

RSpec.describe "paintings/index", type: :view do
  before(:each) do
    assign(:paintings, [
      Painting.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :direction_degrees => 1
      ),
      Painting.create!(
        :latitude => 1.5,
        :longitude => 1.5,
        :direction_degrees => 1
      )
    ])
  end

  it "renders a list of paintings" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
