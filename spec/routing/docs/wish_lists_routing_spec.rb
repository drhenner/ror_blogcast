require "spec_helper"

describe Docs::WishListsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/wish_list" }.should route_to(:controller => "docs/wish_lists", :action => "show")
    end

  end
end
