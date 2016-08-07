require 'rails_helper'

RSpec.describe "paintings/new", type: :view do
  before(:each) do
    assign(:painting, Painting.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :direction_degrees => 1
    ))
  end

  it "renders new painting form" do
    render

    assert_select "form[action=?][method=?]", paintings_path, "post" do

      assert_select "input#painting_latitude[name=?]", "painting[latitude]"

      assert_select "input#painting_longitude[name=?]", "painting[longitude]"

      assert_select "input#painting_direction_degrees[name=?]", "painting[direction_degrees]"
    end
  end
end
