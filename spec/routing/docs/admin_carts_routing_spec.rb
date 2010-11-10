require "spec_helper"

describe Docs::AdminCartsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/admin_cart" }.should route_to(:controller => "docs/admin_carts", :action => "show")
    end

  end
end
