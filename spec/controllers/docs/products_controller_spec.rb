require 'spec_helper'

describe Docs::ProductsController do

  def mock_product(stubs={})
    (@mock_product ||= mock_model(Docs::Product).as_null_object).tap do |product|
      product.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all docs_products as @docs_products" do
      Docs::Product.stub(:all) { [mock_product] }
      get :index
      assigns(:docs_products).should eq([mock_product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      Docs::Product.stub(:find).with("37") { mock_product }
      get :show, :id => "37"
      assigns(:product).should be(mock_product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      Docs::Product.stub(:new) { mock_product }
      get :new
      assigns(:product).should be(mock_product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      Docs::Product.stub(:find).with("37") { mock_product }
      get :edit, :id => "37"
      assigns(:product).should be(mock_product)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created product as @product" do
        Docs::Product.stub(:new).with({'these' => 'params'}) { mock_product(:save => true) }
        post :create, :product => {'these' => 'params'}
        assigns(:product).should be(mock_product)
      end

      it "redirects to the created product" do
        Docs::Product.stub(:new) { mock_product(:save => true) }
        post :create, :product => {}
        response.should redirect_to(docs_product_url(mock_product))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        Docs::Product.stub(:new).with({'these' => 'params'}) { mock_product(:save => false) }
        post :create, :product => {'these' => 'params'}
        assigns(:product).should be(mock_product)
      end

      it "re-renders the 'new' template" do
        Docs::Product.stub(:new) { mock_product(:save => false) }
        post :create, :product => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested product" do
        Docs::Product.should_receive(:find).with("37") { mock_product }
        mock_docs_product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :product => {'these' => 'params'}
      end

      it "assigns the requested product as @product" do
        Docs::Product.stub(:find) { mock_product(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:product).should be(mock_product)
      end

      it "redirects to the product" do
        Docs::Product.stub(:find) { mock_product(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(docs_product_url(mock_product))
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        Docs::Product.stub(:find) { mock_product(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:product).should be(mock_product)
      end

      it "re-renders the 'edit' template" do
        Docs::Product.stub(:find) { mock_product(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      Docs::Product.should_receive(:find).with("37") { mock_product }
      mock_docs_product.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the docs_products list" do
      Docs::Product.stub(:find) { mock_product }
      delete :destroy, :id => "1"
      response.should redirect_to(docs_products_url)
    end
  end

end
