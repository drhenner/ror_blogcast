require 'spec_helper'

describe Docs::AdminCartsController do

  describe "GET show" do
    it "assigns the requested admin_cart as @admin_cart" do
      get :show
    end
  end

end
