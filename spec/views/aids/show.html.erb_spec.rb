require 'rails_helper'

RSpec.describe "aids/show", type: :view do
  before(:each) do
    @aid = assign(:aid, Aid.create!(
      :latitude => 2.5,
      :longitude => 3.5,
      :title => "Title",
      :category => "Category",
      :aid_type => "Aid Type",
      :explanation => "MyText",
      :needy_name => "Needy Name",
      :il => "Il",
      :ilce => "Ilce",
      :mahalle => "Mahalle",
      :cadde => "Cadde",
      :sokak => "Sokak",
      :no => 4,
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Aid Type/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Needy Name/)
    expect(rendered).to match(/Il/)
    expect(rendered).to match(/Ilce/)
    expect(rendered).to match(/Mahalle/)
    expect(rendered).to match(/Cadde/)
    expect(rendered).to match(/Sokak/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Address/)
  end
end
