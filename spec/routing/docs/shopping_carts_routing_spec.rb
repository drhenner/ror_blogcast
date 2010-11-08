require "spec_helper"

describe Docs::ShoppingCartsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/shopping_cart" }.should route_to(:controller => "docs/shopping_carts", :action => "show")
    end

  end
end
