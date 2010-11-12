require "spec_helper"

describe Docs::SolrsController do
  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/docs/solr" }.should route_to(:controller => "docs/solrs", :action => "show")
    end

  end
end
