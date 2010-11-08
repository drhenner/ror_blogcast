require 'spec_helper'

describe Docs::ShoppingCartsController do

  describe "GET show" do
    it "assigns the requested shopping_cart as @shopping_cart" do
      get :show
    end
  end

end
