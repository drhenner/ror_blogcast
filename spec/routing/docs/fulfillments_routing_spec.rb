require "spec_helper"

describe Docs::FulfillmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/docs_fulfillments" }.should route_to(:controller => "docs_fulfillments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/docs_fulfillments/new" }.should route_to(:controller => "docs_fulfillments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/docs_fulfillments/1" }.should route_to(:controller => "docs_fulfillments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/docs_fulfillments/1/edit" }.should route_to(:controller => "docs_fulfillments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/docs_fulfillments" }.should route_to(:controller => "docs_fulfillments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/docs_fulfillments/1" }.should route_to(:controller => "docs_fulfillments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/docs_fulfillments/1" }.should route_to(:controller => "docs_fulfillments", :action => "destroy", :id => "1")
    end

  end
end
