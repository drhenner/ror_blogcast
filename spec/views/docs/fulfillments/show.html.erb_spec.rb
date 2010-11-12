require 'spec_helper'

describe "docs_fulfillments/show.html.erb" do
  before(:each) do
    @fulfillment = assign(:fulfillment, stub_model(Docs::Fulfillment))
  end

  it "renders attributes in <p>" do
    render
  end
end
