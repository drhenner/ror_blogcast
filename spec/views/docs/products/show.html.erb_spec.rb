require 'spec_helper'

describe "docs_products/show.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Docs::Product))
  end

  it "renders attributes in <p>" do
    render
  end
end
