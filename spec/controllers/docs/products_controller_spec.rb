require 'spec_helper'

describe Docs::ProductsController do

  describe "GET show" do
    it "assigns the requested product as @product" do
      Docs::Product.stub(:find).with("37") { mock_product }
      get :show, :id => "37"
      assigns(:product).should be(mock_product)
    end
  end

end
