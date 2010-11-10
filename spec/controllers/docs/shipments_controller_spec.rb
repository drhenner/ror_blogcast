require 'spec_helper'

describe Docs::ShipmentsController do

  describe "GET show" do
    it "assigns the requested shipment as @shipment" do
      get :show
    end
  end

end
