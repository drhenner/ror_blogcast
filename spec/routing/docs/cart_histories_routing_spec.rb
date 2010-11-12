require "spec_helper"

describe Docs::CartHistoriesController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/cart_history" }.should route_to(:controller => "docs/cart_histories", :action => "show")
    end

  end
end
