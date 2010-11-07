require "spec_helper"

describe Docs::ProductsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/product" }.should route_to(:controller => "docs/products", :action => "show")
    end

  end
end
