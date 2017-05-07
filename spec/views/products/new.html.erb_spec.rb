require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :food_type => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_food_type[name=?]", "product[food_type]"

      assert_select "textarea#product_description[name=?]", "product[description]"
    end
  end
end
