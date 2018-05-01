require 'rails_helper'

RSpec.describe "aids/index", type: :view do
  before(:each) do
    assign(:aids, [
      Aid.create!(
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
      ),
      Aid.create!(
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
      )
    ])
  end

  it "renders a list of aids" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Aid Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Needy Name".to_s, :count => 2
    assert_select "tr>td", :text => "Il".to_s, :count => 2
    assert_select "tr>td", :text => "Ilce".to_s, :count => 2
    assert_select "tr>td", :text => "Mahalle".to_s, :count => 2
    assert_select "tr>td", :text => "Cadde".to_s, :count => 2
    assert_select "tr>td", :text => "Sokak".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
