require "spec_helper"

describe Docs::InstallationsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/installation" }.should route_to(:controller => "docs/installations", :action => "show")
    end

  end
end
