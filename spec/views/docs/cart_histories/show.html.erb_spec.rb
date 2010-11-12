require 'spec_helper'

describe "docs_cart_histories/show.html.erb" do
  before(:each) do
    @cart_history = assign(:cart_history, stub_model(Docs::CartHistory))
  end

  it "renders attributes in <p>" do
    render
  end
end
