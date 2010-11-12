require 'spec_helper'

describe Docs::FulfillmentsController do

  def mock_fulfillment(stubs={})
    (@mock_fulfillment ||= mock_model(Docs::Fulfillment).as_null_object).tap do |fulfillment|
      fulfillment.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all docs_fulfillments as @docs_fulfillments" do
      Docs::Fulfillment.stub(:all) { [mock_fulfillment] }
      get :index
      assigns(:docs_fulfillments).should eq([mock_fulfillment])
    end
  end

  describe "GET show" do
    it "assigns the requested fulfillment as @fulfillment" do
      Docs::Fulfillment.stub(:find).with("37") { mock_fulfillment }
      get :show, :id => "37"
      assigns(:fulfillment).should be(mock_fulfillment)
    end
  end

  describe "GET new" do
    it "assigns a new fulfillment as @fulfillment" do
      Docs::Fulfillment.stub(:new) { mock_fulfillment }
      get :new
      assigns(:fulfillment).should be(mock_fulfillment)
    end
  end

  describe "GET edit" do
    it "assigns the requested fulfillment as @fulfillment" do
      Docs::Fulfillment.stub(:find).with("37") { mock_fulfillment }
      get :edit, :id => "37"
      assigns(:fulfillment).should be(mock_fulfillment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fulfillment as @fulfillment" do
        Docs::Fulfillment.stub(:new).with({'these' => 'params'}) { mock_fulfillment(:save => true) }
        post :create, :fulfillment => {'these' => 'params'}
        assigns(:fulfillment).should be(mock_fulfillment)
      end

      it "redirects to the created fulfillment" do
        Docs::Fulfillment.stub(:new) { mock_fulfillment(:save => true) }
        post :create, :fulfillment => {}
        response.should redirect_to(docs_fulfillment_url(mock_fulfillment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fulfillment as @fulfillment" do
        Docs::Fulfillment.stub(:new).with({'these' => 'params'}) { mock_fulfillment(:save => false) }
        post :create, :fulfillment => {'these' => 'params'}
        assigns(:fulfillment).should be(mock_fulfillment)
      end

      it "re-renders the 'new' template" do
        Docs::Fulfillment.stub(:new) { mock_fulfillment(:save => false) }
        post :create, :fulfillment => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fulfillment" do
        Docs::Fulfillment.should_receive(:find).with("37") { mock_fulfillment }
        mock_docs_fulfillment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fulfillment => {'these' => 'params'}
      end

      it "assigns the requested fulfillment as @fulfillment" do
        Docs::Fulfillment.stub(:find) { mock_fulfillment(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fulfillment).should be(mock_fulfillment)
      end

      it "redirects to the fulfillment" do
        Docs::Fulfillment.stub(:find) { mock_fulfillment(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(docs_fulfillment_url(mock_fulfillment))
      end
    end

    describe "with invalid params" do
      it "assigns the fulfillment as @fulfillment" do
        Docs::Fulfillment.stub(:find) { mock_fulfillment(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fulfillment).should be(mock_fulfillment)
      end

      it "re-renders the 'edit' template" do
        Docs::Fulfillment.stub(:find) { mock_fulfillment(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fulfillment" do
      Docs::Fulfillment.should_receive(:find).with("37") { mock_fulfillment }
      mock_docs_fulfillment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the docs_fulfillments list" do
      Docs::Fulfillment.stub(:find) { mock_fulfillment }
      delete :destroy, :id => "1"
      response.should redirect_to(docs_fulfillments_url)
    end
  end

end
