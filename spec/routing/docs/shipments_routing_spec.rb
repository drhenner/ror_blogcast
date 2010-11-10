require "spec_helper"

describe Docs::ShipmentsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/shipment" }.should route_to(:controller => "docs/shipments", :action => "show")
    end

  end
end
