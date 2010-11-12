require 'spec_helper'

describe "docs_wish_lists/show.html.erb" do
  before(:each) do
    @wish_list = assign(:wish_list, stub_model(Docs::WishList))
  end

  it "renders attributes in <p>" do
    render
  end
end
