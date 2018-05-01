require 'rails_helper'

RSpec.describe "aids/new", type: :view do
  before(:each) do
    assign(:aid, Aid.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :title => "MyString",
      :category => "MyString",
      :aid_type => "MyString",
      :explanation => "MyText",
      :needy_name => "MyString",
      :il => "MyString",
      :ilce => "MyString",
      :mahalle => "MyString",
      :cadde => "MyString",
      :sokak => "MyString",
      :no => 1,
      :address => "MyString"
    ))
  end

  it "renders new aid form" do
    render

    assert_select "form[action=?][method=?]", aids_path, "post" do

      assert_select "input[name=?]", "aid[latitude]"

      assert_select "input[name=?]", "aid[longitude]"

      assert_select "input[name=?]", "aid[title]"

      assert_select "input[name=?]", "aid[category]"

      assert_select "input[name=?]", "aid[aid_type]"

      assert_select "textarea[name=?]", "aid[explanation]"

      assert_select "input[name=?]", "aid[needy_name]"

      assert_select "input[name=?]", "aid[il]"

      assert_select "input[name=?]", "aid[ilce]"

      assert_select "input[name=?]", "aid[mahalle]"

      assert_select "input[name=?]", "aid[cadde]"

      assert_select "input[name=?]", "aid[sokak]"

      assert_select "input[name=?]", "aid[no]"

      assert_select "input[name=?]", "aid[address]"
    end
  end
end
