require "spec_helper"

describe Docs::PurchaseOrdersController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/purchase_order" }.should route_to(:controller => "docs/purchase_orders", :action => "show")
    end

  end
end
