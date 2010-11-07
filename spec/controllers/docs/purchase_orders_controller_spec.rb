require 'spec_helper'

describe Docs::PurchaseOrdersController do

  describe "GET show" do
    it "assigns the requested purchase_order as @purchase_order" do
      get :show
    end
  end

end
