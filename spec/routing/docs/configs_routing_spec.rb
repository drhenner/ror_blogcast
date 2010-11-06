require "spec_helper"

describe Docs::ConfigsController do
  describe "routing" do


    it "recognizes and generates #show" do
      { :get => "/docs/config" }.should route_to(:controller => "docs/configs", :action => "show")
    end

  end
end
