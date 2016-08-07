require 'rails_helper'

RSpec.describe "paintings/edit", type: :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :direction_degrees => 1
    ))
  end

  it "renders the edit painting form" do
    render

    assert_select "form[action=?][method=?]", painting_path(@painting), "post" do

      assert_select "input#painting_latitude[name=?]", "painting[latitude]"

      assert_select "input#painting_longitude[name=?]", "painting[longitude]"

      assert_select "input#painting_direction_degrees[name=?]", "painting[direction_degrees]"
    end
  end
end
