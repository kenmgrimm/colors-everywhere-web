require 'rails_helper'

RSpec.describe "paintings/show", type: :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :direction_degrees => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
  end
end
