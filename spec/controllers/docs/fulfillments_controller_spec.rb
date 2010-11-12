require 'spec_helper'

describe Docs::FulfillmentsController do

  describe "GET show" do
    it "assigns the requested fulfillment as @fulfillment" do
      get :show
    end
  end

end
