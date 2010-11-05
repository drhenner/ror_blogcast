require 'spec_helper'

describe "docs_installations/show.html.erb" do
  before(:each) do
    @installation = assign(:installation, stub_model(Docs::Installation))
  end

  it "renders attributes in <p>" do
    render
  end
end
