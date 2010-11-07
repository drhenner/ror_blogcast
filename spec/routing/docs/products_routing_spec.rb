require "spec_helper"

describe Docs::ProductsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/docs_products" }.should route_to(:controller => "docs_products", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/docs_products/new" }.should route_to(:controller => "docs_products", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/docs_products/1" }.should route_to(:controller => "docs_products", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/docs_products/1/edit" }.should route_to(:controller => "docs_products", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/docs_products" }.should route_to(:controller => "docs_products", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/docs_products/1" }.should route_to(:controller => "docs_products", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/docs_products/1" }.should route_to(:controller => "docs_products", :action => "destroy", :id => "1")
    end

  end
end
