require "spec_helper"

describe Info::AboutsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/info/about" }.should route_to(:controller => "info/abouts", :action => "show")
    end

  end
end
